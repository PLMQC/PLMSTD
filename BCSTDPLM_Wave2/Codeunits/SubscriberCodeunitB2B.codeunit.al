codeunit 33000893 "SubscriberCodeunit B2B"
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Table, 17, 'OnAfterCopyGLEntryFromGenJnlLine', '', false, false)]
    local procedure MachineIdUpdate(VAR GLEntry: Record "G/L Entry"; VAR GenJournalLine: Record "Gen. Journal Line")
    begin
        GLEntry."Machine Id B2B" := GenJournalLine."Machine Id B2B";
    end;

    [EventSubscriber(ObjectType::Table, 39, 'OnValidateNoOnAfterChecks', '', false, false)]
    local procedure JobCardNoCheck(VAR PurchaseLine: Record "Purchase Line"; xPurchaseLine: Record "Purchase Line"; CallingFieldNo: Integer)
    begin
        PurchaseLine.TESTFIELD("Job Card No. B2B", '');
    end;

    [EventSubscriber(ObjectType::Table, 121, 'OnAfterInitFromPurchLine', '', false, false)]
    local procedure MachineIdandJobNoUpdate(PurchRcptHeader: Record "Purch. Rcpt. Header"; PurchLine: Record "Purchase Line"; VAR PurchRcptLine: Record "Purch. Rcpt. Line")
    begin
        PurchRcptLine."Machine Id. B2B" := PurchLine."Machine Id B2B";
        PurchRcptLine."Job Card No. B2B" := PurchLine."Job Card No. B2B";
    end;

    [EventSubscriber(ObjectType::Table, 203, 'OnAfterCopyFromResJnlLine', '', false, false)]
    local procedure MachineIdUpdateInResLedgeEntry(VAR ResLedgerEntry: Record "Res. Ledger Entry"; ResJournalLine: Record "Res. Journal Line")
    begin
        ResLedgerEntry."Machine Id B2B" := ResJournalLine."Machine Id B2B";
    end;

    [EventSubscriber(ObjectType::Codeunit, 90, 'OnBeforePostPurchaseDoc', '', false, false)]
    local procedure CheckJobLinesPost(VAR PurchaseHeader: Record "Purchase Header"; PreviewMode: Boolean; CommitIsSupressed: Boolean; VAR HideProgressWindow: Boolean)
    var

        JobHeaderRec: Record "PM Job Header B2B";
        Text20003Lbl: Label 'ENU=Job Card No.:%1 not posted.', comment = '%1 = No.';
    begin
        PurchLineRec.RESET();
        PurchLineRec.SETRANGE("Document Type", PurchaseHeader."Document Type");
        PurchLineRec.SETRANGE("Document No.", PurchaseHeader."No.");
        IF PurchLineRec.FINDFIRST() THEN
            REPEAT
                IF JobHeaderRec.GET(PurchLineRec."Job Card No. B2B", PurchLineRec."Machine Id B2B") THEN
                    IF NOT JobHeaderRec.Posted THEN
                        ERROR(Text20003Lbl, JobHeaderRec."No.");
            UNTIL PurchLineRec.NEXT() = 0;
    end;

    [EventSubscriber(ObjectType::Codeunit, 22, 'OnBeforeInsertCapLedgEntry', '', false, false)]
    local procedure MachineIdUpdateInCapLedgEntry(VAR CapLedgEntry: Record "Capacity Ledger Entry"; ItemJournalLine: Record "Item Journal Line")
    begin
        CapLedgEntry."Machine Id B2B" := ItemJournalLine."Machine Id B2B";
    end;

    [EventSubscriber(ObjectType::Codeunit, 22, 'OnAfterInitItemLedgEntry', '', false, false)]
    local procedure MachineIdUpdateInItemLedgEntry(VAR NewItemLedgEntry: Record "Item Ledger Entry"; ItemJournalLine: Record "Item Journal Line"; VAR ItemLedgEntryNo: Integer)
    begin
        NewItemLedgEntry."Machine Id B2B" := ItemJournalLine."Machine Id B2B";
    end;

    [EventSubscriber(ObjectType::Codeunit, 13, 'OnBeforeUpdateAndDeleteLines', '', false, false)]
    local procedure WorkSheetsUpdate(VAR GenJournalLine: Record "Gen. Journal Line"; CommitIsSuppressed: Boolean)
    var
        GenJnlTemplate: Record "Gen. Journal Template";

    begin
        GenJnlTemplate.GET(GenJournalLine."Journal Template Name");
        IF Not GenJnlTemplate.Recurring then begin
            WorkSheetRec.reset();
            WorkSheetRec.SETRANGE("Job Card No.", GenJournalLine."External Document No.");
            WorkSheetRec.SETRANGE("Misc. Account", GenJournalLine."Account No.");
            IF WorkSheetRec.FINDFIRST() THEN BEGIN
                WorkSheetRec."Cost Posted" := TRUE;
                WorkSheetRec.MODIFY();
            END;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, 6500, 'OnRetrieveItemTrackingFromReservEntryFilter', '', false, false)]
    local procedure RetrieveItemTrackingWorkSheet(VAR ReservEntry: Record "Reservation Entry"; ItemJournalLine: Record "Item Journal Line")
    var
        TempTrackingSpec: Record "Tracking Specification";
        ItemTrackingMgtLVar: Codeunit "Item Tracking Management";
        ReservEntry2: Record "Reservation Entry";
    begin
        ReservEntry2.SETRANGE("Source ID", ItemJournalLine."Journal Template Name");
        ReservEntry2.SETRANGE("Source Type", DATABASE::"Work Sheet B2B");
        ReservEntry2.SETRANGE("Source Subtype", 3);
        ReservEntry2.SETRANGE("Source Ref. No.", ItemJournalLine."Line No.");
        ReservEntry2.SETRANGE("Source Batch Name", ItemJournalLine."Journal Batch Name");
        ReservEntry2.SETRANGE("Source Prod. Order Line", 0);
        ReservEntry2.SETFILTER("Qty. to Handle (Base)", '<>0');
        IF ItemTrackingMgtLVar.SumUpItemTracking(ReservEntry2, TempTrackingSpec, FALSE, TRUE) THEN BEGIN
            ReservEntry2.SETRANGE("Reservation Status", ReservEntry2."Reservation Status"::Prospect);
            IF NOT ReservEntry2.ISEMPTY() THEN
                ReservEntry2.DELETEALL();
        END
    end;

    [EventSubscriber(ObjectType::Codeunit, 22, 'OnPostOutputOnAfterInsertCapLedgEntry', '', false, false)]
    local procedure InsertEquipLedgEntry(ItemJournalLine: Record "Item Journal Line"; VAR SkipPost: Boolean)
    var
        EquipmentLedgEntry: Record "Equipment Ledger Entry B2B";
        PLMMethods: Codeunit "PLMMethods B2B";
    begin
        PLMMethods.InsertEquipmentLedgEntry(ItemJournalLine, EquipmentLedgEntry, ItemJournalLine."Stop Time", ItemJournalLine."Stop Time");
        PLMMethods.InsertEquLedgEntryMacenters(ItemJournalLine, EquipmentLedgEntry, ItemJournalLine."Stop Time", ItemJournalLine."Stop Time")
    end;

    [EventSubscriber(ObjectType::Codeunit, 22, 'OnAfterPostItemJnlLine', '', false, false)]
    local procedure PostWorksheet(VAR ItemJournalLine: Record "Item Journal Line"; ItemLedgerEntry: Record "Item Ledger Entry")
    var
        PLMMethods: Codeunit "PLMMethods B2B";
    begin
        IF ItemJournalLine."Post Worksheet B2B" THEN
            PLMMethods.PostWHJnlLine(ItemJournalLine, ItemJournalLine.Quantity, ItemJournalLine."Quantity (Base)");
    end;

    [EventSubscriber(ObjectType::Codeunit, 22, 'OnBeforePostItemJnlLine', '', false, false)]
    local procedure EquipmentCheck(VAR ItemJournalLine: Record "Item Journal Line"; CalledFromAdjustment: Boolean; CalledFromInvtPutawayPick: Boolean)
    var

        ProdOrderRtngLine: Record 5409;
        EquipmentErr: Label 'Associated Equipment for WorkCentre %1 is under maintenance.', Comment = '%1 = No.';

    begin
        IF ItemJournalLine."Entry Type" <> ItemJournalLine."Entry Type"::Output then
            exit;
        IF (ItemJournalLine."Stop Time" <> 0) and ItemJournalLine.OnlyStopTime() THEN
            Exit;
        IF ItemJournalLine.OutputValuePosting() THEN
            exit;
        IF ItemJournalLine."Item Shpt. Entry No." = 0 THEN begin
            ProdOrderRtngLine.SETRANGE(Status, ProdOrderRtngLine.Status::Released);
            ProdOrderRtngLine.SETRANGE("Prod. Order No.", ItemJournalLine."Order No.");
            ProdOrderRtngLine.SETRANGE("Routing Reference No.", ItemJournalLine."Routing Reference No.");
            ProdOrderRtngLine.SETRANGE("Routing No.", ItemJournalLine."Routing No.");
            IF Not ProdOrderRtngLine.IsEmpty() THEN BEGIN
                IF ItemJournalLine.Type = ItemJournalLine.Type::"Machine Center" THEN BEGIN
                    Equipment.RESET();
                    Equipment.SETRANGE(Type, Equipment.Type::"Machine Center");
                    Equipment.SETRANGE("M/W No.", ItemJournalLine."No.");
                    IF Equipment.FINDFIRST() THEN
                        IF NOT ((Equipment."Equipment Status" = Equipment."Equipment Status"::" ") OR
                        (Equipment."Equipment Status" = Equipment."Equipment Status"::Running)) THEN
                            ERROR(EquipmentErr, ItemJournalLine."No.");
                End;

                IF ItemJournalLine.Type = ItemJournalLine.Type::"Work Center" THEN BEGIN
                    Equipment.RESET();
                    Equipment.SETRANGE(Type, Equipment.Type::"Work Center");
                    Equipment.SETRANGE("M/W No.", ItemJournalLine."No.");
                    IF Equipment.FINDFIRST() THEN
                        IF NOT ((Equipment."Equipment Status" = Equipment."Equipment Status"::" ") OR
                          (Equipment."Equipment Status" = Equipment."Equipment Status"::Running)) THEN
                            ERROR(EquipmentErr, ItemJournalLine."No.");
                END;

            end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, 22, 'OnPostOutputOnAfterInsertCostValueEntries', '', false, false)]
    local procedure EquipLedgEntryBasedonSubcontracting(ItemJournalLine: Record "Item Journal Line"; var CapLedgEntry: Record "Capacity Ledger Entry"; CalledFromAdjustment: Boolean; PostToGL: Boolean)
    var
        EquipLedgEntry: Record 33000944;
        PLMMethods: Codeunit "PLMMethods B2B";
        ValuedQty: Decimal;
    begin
        IF ItemJournalLine.Subcontracting THEN BEGIN
            PLMMethods.InsertEquipmentLedgEntry(ItemJournalLine, EquipLedgEntry, ItemJournalLine.Quantity, ItemJournalLine."Invoiced Quantity");
            PLMMethods.InsertEquLedgEntryMacenters(ItemJournalLine, EquipLedgEntry, ItemJournalLine.Quantity, ItemJournalLine."Invoiced Quantity");
        end Else Begin
            ValuedQty := PLMMethods.CalcCapQty(ItemJournalLine);
            PLMMethods.InsertEquipmentLedgEntry(ItemJournalLine, EquipLedgEntry, ValuedQty, ValuedQty);
            PLMMethods.InsertEquLedgEntryMacenters(ItemJournalLine, EquipLedgEntry, ValuedQty, ValuedQty);
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, 408, 'OnAfterSetupObjectNoList', '', false, false)]
    local procedure AddCustomObjectNo(VAR TempAllObjWithCaption: Record AllObjWithCaption temporary)
    var
        DimMgmt: Codeunit DimensionManagement;
    begin
        DimMgmt.InsertObject(TempAllObjWithCaption, 33000891);
    end;

    [EventSubscriber(ObjectType::Table, 81, 'OnAfterCopyGenJnlLineFromPurchHeader', '', false, false)]

    local procedure UpdMachineNum(PurchaseHeader: Record "Purchase Header"; VAR GenJournalLine: Record "Gen. Journal Line")
    begin
        GenJournalLine."Machine Id B2B" := PurchaseHeader."Machine Id B2B";
    end;

    var
        PurchLineRec: Record "Purchase Line";
        WorkSheetRec: Record "Work Sheet B2B";
        Equipment: Record 33000891;
}