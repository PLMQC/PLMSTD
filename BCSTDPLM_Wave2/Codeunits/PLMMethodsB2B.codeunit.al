codeunit 33000894 "PLMMethods B2B"
{
    trigger OnRun()
    begin
    end;

    PROCEDURE CallItemTrackingPLM(VAR PLMWorkSheet: Record "Work Sheet B2B"; IsReclass: Boolean);
    VAR
        TrackingSpecification: Record "Tracking Specification";
        ItemTrackingForm: Page "Item Tracking Lines";
    BEGIN
        PLMWorkSheet.TESTFIELD("I/R Code");
        InitTrackingSpecificationPLM(PLMWorkSheet, TrackingSpecification);
        IF IsReclass THEN
            ItemTrackingForm.SetFormRunMode(1);
        ItemTrackingForm.SetSourceSpec(TrackingSpecification, PLMWorkSheet."Posting Date");
        ItemTrackingForm.RUNMODAL();
    END;

    [EventSubscriber(ObjectType::Codeunit, 90, 'OnBeforePostPurchaseDoc', '', true, true)]
    local procedure OnBeforePostPurchaseDoc(VAR PurchaseHeader: Record "Purchase Header"; PreviewMode: Boolean; CommitIsSupressed: Boolean)
    begin
        //B2BPLM- VK1.0,Begin
        ChechJobLinesPost(PurchaseHeader);
        //B2BPLM- VK1.0,End

    end;

    PROCEDURE ChechJobLinesPost(VAR PurchHeaderRec: Record 38);
    VAR
        JobHeaderRec: Record 33000903;
        Text20003Lbl: Label 'Job Card No.:%1 not posted.', Comment = '%1 = No.';
    BEGIN
        PurchLineRec.RESET();
        PurchLineRec.SETRANGE("Document Type", PurchHeaderRec."Document Type");
        PurchLineRec.SETRANGE("Document No.", PurchHeaderRec."No.");
        IF PurchLineRec.FINDFIRST() THEN
            REPEAT
                IF JobHeaderRec.GET(PurchLineRec."Job Card No. B2B", PurchLineRec."Machine Id B2B") THEN
                    IF NOT JobHeaderRec.Posted THEN
                        ERROR(Text20003Lbl, JobHeaderRec."No.");
            UNTIL PurchLineRec.NEXT() = 0;
    END;

    PROCEDURE InitTrackingSpecificationPLM(VAR PLMWorkSheet: Record 33000905; VAR TrackingSpecification: Record 336);
    VAR
        PLMSetup: Record 33000890;
        ItemTextLbl: Label 'ITEM';
    BEGIN
        PLMSetup.GET();
        TrackingSpecification.INIT();
        TrackingSpecification."Source Type" := DATABASE::"Work Sheet B2B";
        TrackingSpecification."Item No." := PLMWorkSheet."I/R Code";
        TrackingSpecification.Description := PLMWorkSheet."I/R Description";
        TrackingSpecification."Location Code" := Copystr(PLMWorkSheet."Location Code", 1, 10);
        TrackingSpecification."Source Subtype" := 3;
        TrackingSpecification."Source ID" := ItemTextLbl;
        TrackingSpecification."Source Batch Name" := PLMSetup."Item Journal Batch";
        TrackingSpecification."Source Ref. No." := 10000;
        TrackingSpecification."Quantity (Base)" := PLMWorkSheet.Quantity;
        TrackingSpecification."Qty. to Handle" := PLMWorkSheet.Quantity;
        TrackingSpecification."Qty. to Handle (Base)" := PLMWorkSheet.Quantity;
        TrackingSpecification."Qty. to Invoice" := PLMWorkSheet.Quantity;
        TrackingSpecification."Qty. to Invoice (Base)" := PLMWorkSheet.Quantity;
        TrackingSpecification."Quantity Handled (Base)" := PLMWorkSheet.Quantity;
        TrackingSpecification."Quantity Invoiced (Base)" := PLMWorkSheet.Quantity;
        TrackingSpecification."Bin Code" := PLMWorkSheet."Bin Code";
    END;

    procedure InsertEquipmentLedgEntry(Var ItemJournalLine: Record 83; Var EquipmentLedgerEntry: Record 33000944; Qty: Decimal; InvdQty: Decimal)
    var
        EquipmentLedgerEntryNo: Integer;
    begin
        WorkCenter.RESET();
        WorkCenter.SETRANGE("No.", ItemJournalLine."No.");
        IF WorkCenter.FINDFIRST() THEN BEGIN
            Machine.SETRANGE(Type, Machine.Type::"Work Center");
            Machine.SETRANGE("M/W No.", WorkCenter."No.");
            Machine.SETRANGE("Is In Use", TRUE);
            IF Machine.FINDFIRST() THEN
                REPEAT
                    IF EquipmentLedgerEntryNo = 0 THEN BEGIN
                        EquipmentLedgerEntry.LOCKTABLE();
                        IF EquipmentLedgerEntry.FINDLAST() THEN
                            EquipmentLedgerEntryNo := EquipmentLedgerEntry."Entry No.";
                    END;
                    EquipmentLedgerEntryNo := EquipmentLedgerEntryNo + 1;

                    EquipmentLedgerEntry.INIT();
                    EquipmentLedgerEntry."Entry No." := EquipmentLedgerEntryNo;
                    EquipmentLedgerEntry."Operation No." := ItemJournalLine."Operation No.";
                    EquipmentLedgerEntry.Type := ItemJournalLine.Type;
                    EquipmentLedgerEntry."No." := ItemJournalLine."No.";
                    EquipmentLedgerEntry."Machine Id" := ItemJournalLine."Machine Id B2B";
                    EquipmentLedgerEntry.Description := ItemJournalLine.Description;
                    EquipmentLedgerEntry."Work Center No." := ItemJournalLine."Work Center No.";
                    EquipmentLedgerEntry."Work Center Group Code" := ItemJournalLine."Work Center Group Code";
                    EquipmentLedgerEntry.Subcontracting := ItemJournalLine.Subcontracting;

                    EquipmentLedgerEntry.Quantity := ItemJournalLine."Stop Time";
                    EquipmentLedgerEntry."Invoiced Quantity" := ItemJournalLine."Stop Time";
                    EquipmentLedgerEntry."Completely Invoiced" := EquipmentLedgerEntry."Invoiced Quantity" = EquipmentLedgerEntry.Quantity;

                    EquipmentLedgerEntry."Setup Time" := ItemJournalLine."Setup Time";
                    EquipmentLedgerEntry."Run Time" := ItemJournalLine."Run Time";
                    EquipmentLedgerEntry."Stop Time" := ItemJournalLine."Stop Time";

                    IF ItemJournalLine."Unit Cost Calculation" = ItemJournalLine."Unit Cost Calculation"::Time THEN BEGIN
                        EquipmentLedgerEntry."Cap. Unit of Measure Code" := ItemJournalLine."Cap. Unit of Measure Code";
                        EquipmentLedgerEntry."Qty. per Cap. Unit of Measure" := ItemJournalLine."Qty. per Cap. Unit of Measure";
                    END;

                    EquipmentLedgerEntry."Item No." := ItemJournalLine."Item No.";
                    EquipmentLedgerEntry."Variant Code" := ItemJournalLine."Variant Code";
                    EquipmentLedgerEntry."Output Quantity" := ItemJournalLine."Output Quantity";
                    EquipmentLedgerEntry."Scrap Quantity" := ItemJournalLine."Scrap Quantity";
                    EquipmentLedgerEntry."Unit of Measure Code" := ItemJournalLine."Unit of Measure Code";
                    EquipmentLedgerEntry."Qty. per Unit of Measure" := ItemJournalLine."Qty. per Unit of Measure";

                    EquipmentLedgerEntry."Prod. Order No." := ItemJournalLine."Order No.";
                    EquipmentLedgerEntry."Prod. Order Line No." := ItemJournalLine."Order Line No.";
                    EquipmentLedgerEntry."Routing No." := ItemJournalLine."Routing No.";
                    EquipmentLedgerEntry."Routing Reference No." := ItemJournalLine."Routing Reference No.";
                    EquipmentLedgerEntry."Operation No." := ItemJournalLine."Operation No.";

                    EquipmentLedgerEntry."Posting Date" := ItemJournalLine."Posting Date";
                    EquipmentLedgerEntry."Document Date" := ItemJournalLine."Document Date";
                    EquipmentLedgerEntry."Document No." := ItemJournalLine."Document No.";
                    EquipmentLedgerEntry."External Document No." := ItemJournalLine."External Document No.";

                    EquipmentLedgerEntry."Starting Time" := ItemJournalLine."Starting Time";
                    EquipmentLedgerEntry."Ending Time" := ItemJournalLine."Ending Time";
                    EquipmentLedgerEntry."Concurrent Capacity" := ItemJournalLine."Concurrent Capacity";
                    EquipmentLedgerEntry."Work Shift Code" := ItemJournalLine."Work Shift Code";

                    EquipmentLedgerEntry."Stop Code" := ItemJournalLine."Stop Code";
                    EquipmentLedgerEntry."Scrap Code" := ItemJournalLine."Scrap Code";
                    //EquipmentLedgerEntry."Last Output Line" := LastOperation; //Need to Check

                    EquipmentLedgerEntry."Global Dimension 1 Code" := ItemJournalLine."Shortcut Dimension 1 Code";
                    EquipmentLedgerEntry."Global Dimension 2 Code" := ItemJournalLine."Shortcut Dimension 2 Code";
                    EquipmentLedgerEntry."Machine Id" := Machine."No.";
                    EquipmentLedgerEntry.INSERT();
                UNTIL Machine.NEXT() = 0;
        END;
    end;

    procedure InsertEquLedgEntryMacenters(Var ItemJnlLine: Record 83; Var EquipmentLedgerEntry: Record 33000944; Qty: Decimal; InvdQty: Decimal)
    var
        EquipmentLedgerEntryNo: Integer;
    begin
        MachineCenter.RESET();
        MachineCenter.SETRANGE("No.", ItemJnlLine."No.");
        IF MachineCenter.FINDFIRST() THEN BEGIN
            Machine.SETRANGE(Type, Machine.Type::"Machine Center");
            Machine.SETRANGE("M/W No.", MachineCenter."No.");
            Machine.SETRANGE("Is In Use", TRUE);
            IF Machine.FINDFIRST() THEN
                REPEAT
                    IF EquipmentLedgerEntryNo = 0 THEN BEGIN
                        EquipmentLedgerEntry.LOCKTABLE();
                        IF EquipmentLedgerEntry.FINDLAST() THEN
                            EquipmentLedgerEntryNo := EquipmentLedgerEntry."Entry No.";
                    END;
                    EquipmentLedgerEntryNo := EquipmentLedgerEntryNo + 1;

                    EquipmentLedgerEntry.INIT();
                    EquipmentLedgerEntry."Entry No." := EquipmentLedgerEntryNo;
                    EquipmentLedgerEntry."Operation No." := ItemJnlLine."Operation No.";
                    EquipmentLedgerEntry.Type := ItemJnlLine.Type;
                    EquipmentLedgerEntry."No." := ItemJnlLine."No.";
                    EquipmentLedgerEntry."Machine Id" := ItemJnlLine."Machine Id B2B";
                    EquipmentLedgerEntry.Description := ItemJnlLine.Description;
                    EquipmentLedgerEntry."Work Center No." := ItemJnlLine."Work Center No.";
                    EquipmentLedgerEntry."Work Center Group Code" := ItemJnlLine."Work Center Group Code";
                    EquipmentLedgerEntry.Subcontracting := ItemJnlLine.Subcontracting;

                    EquipmentLedgerEntry.Quantity := Qty;
                    EquipmentLedgerEntry."Invoiced Quantity" := InvdQty;
                    EquipmentLedgerEntry."Completely Invoiced" := EquipmentLedgerEntry."Invoiced Quantity" = EquipmentLedgerEntry.Quantity;

                    EquipmentLedgerEntry."Setup Time" := ItemJnlLine."Setup Time";
                    EquipmentLedgerEntry."Run Time" := ItemJnlLine."Run Time";
                    EquipmentLedgerEntry."Stop Time" := ItemJnlLine."Stop Time";

                    IF ItemJnlLine."Unit Cost Calculation" = ItemJnlLine."Unit Cost Calculation"::Time THEN BEGIN
                        EquipmentLedgerEntry."Cap. Unit of Measure Code" := ItemJnlLine."Cap. Unit of Measure Code";
                        EquipmentLedgerEntry."Qty. per Cap. Unit of Measure" := ItemJnlLine."Qty. per Cap. Unit of Measure";
                    END;

                    EquipmentLedgerEntry."Item No." := ItemJnlLine."Item No.";
                    EquipmentLedgerEntry."Variant Code" := ItemJnlLine."Variant Code";
                    EquipmentLedgerEntry."Output Quantity" := ItemJnlLine."Output Quantity";
                    EquipmentLedgerEntry."Scrap Quantity" := ItemJnlLine."Scrap Quantity";
                    EquipmentLedgerEntry."Unit of Measure Code" := ItemJnlLine."Unit of Measure Code";
                    EquipmentLedgerEntry."Qty. per Unit of Measure" := ItemJnlLine."Qty. per Unit of Measure";

                    EquipmentLedgerEntry."Prod. Order No." := ItemJnlLine."Order No.";
                    EquipmentLedgerEntry."Prod. Order Line No." := ItemJnlLine."Order Line No.";
                    EquipmentLedgerEntry."Routing No." := ItemJnlLine."Routing No.";
                    EquipmentLedgerEntry."Routing Reference No." := ItemJnlLine."Routing Reference No.";
                    EquipmentLedgerEntry."Operation No." := ItemJnlLine."Operation No.";

                    EquipmentLedgerEntry."Posting Date" := ItemJnlLine."Posting Date";
                    EquipmentLedgerEntry."Document Date" := ItemJnlLine."Document Date";
                    EquipmentLedgerEntry."Document No." := ItemJnlLine."Document No.";
                    EquipmentLedgerEntry."External Document No." := ItemJnlLine."External Document No.";

                    EquipmentLedgerEntry."Starting Time" := ItemJnlLine."Starting Time";
                    EquipmentLedgerEntry."Ending Time" := ItemJnlLine."Ending Time";
                    EquipmentLedgerEntry."Concurrent Capacity" := ItemJnlLine."Concurrent Capacity";
                    EquipmentLedgerEntry."Work Shift Code" := ItemJnlLine."Work Shift Code";

                    EquipmentLedgerEntry."Stop Code" := ItemJnlLine."Stop Code";
                    EquipmentLedgerEntry."Scrap Code" := ItemJnlLine."Scrap Code";
                    //EquipmentLedgerEntry."Last Output Line" := LastOperation; //Need to check

                    EquipmentLedgerEntry."Global Dimension 1 Code" := ItemJnlLine."Shortcut Dimension 1 Code";
                    EquipmentLedgerEntry."Global Dimension 2 Code" := ItemJnlLine."Shortcut Dimension 2 Code";
                    EquipmentLedgerEntry."Machine Id" := Machine."No.";
                    EquipmentLedgerEntry.INSERT();
                UNTIL Machine.NEXT() = 0;
        END;
    end;

    PROCEDURE PostWHJnlLine(ItemJnlLine: Record 83; OriginalQuantity: Decimal; OriginalQuantityBase: Decimal);
    VAR
        ItemJnlTemplate: Record 82;
        WhseJnlLine: Record 7311;
        TempWhseJnlLine2: Record 7311 temporary;
        TempHandlingSpecification: Record 336 TEMPORARY;
        LocationLVar: Record Location;
        ItemTrackingMgt: Codeunit 6500;
        WMSMgmt: Codeunit 7302;
        WhseJnlRegisterLine: Codeunit 7301;
    BEGIN
        ItemJnlLine.Quantity := OriginalQuantity;
        ItemJnlLine."Quantity (Base)" := OriginalQuantityBase;
        LocationLVar.GET(ItemJnlLine."Location Code");
        IF (ItemJnlLine."Entry Type" IN [ItemJnlLine."Entry Type"::"Negative Adjmt."]) THEN
            IF LocationLVar."Bin Mandatory" THEN
                IF WMSMgmt.CreateWhseJnlLine(ItemJnlLine, ItemJnlTemplate.Type.AsInteger(), WhseJnlLine, FALSE) THEN BEGIN
                    ItemTrackingMgt.SplitWhseJnlLine(WhseJnlLine, TempWhseJnlLine2, TempHandlingSpecification, FALSE);
                    IF TempWhseJnlLine2.FINDSET() THEN
                        REPEAT
                            WMSMgmt.CheckWhseJnlLine(TempWhseJnlLine2, 1, 0, FALSE);
                            WhseJnlRegisterLine.RUN(TempWhseJnlLine2);
                        UNTIL TempWhseJnlLine2.NEXT() = 0;
                END;
    END;

    PROCEDURE CalcCapQty(ItemJnlLine: Record "Item Journal Line") CapQty: Decimal;
    var
        MfgSetup: Record "Manufacturing Setup";
    BEGIN
        MfgSetup.GET();
        IF ItemJnlLine."Unit Cost Calculation" = ItemJnlLine."Unit Cost Calculation"::Time THEN BEGIN
            IF MfgSetup."Cost Incl. Setup" THEN
                CapQty := ItemJnlLine."Setup Time" + ItemJnlLine."Run Time"
            ELSE
                CapQty := ItemJnlLine."Run Time";
        END ELSE
            CapQty := ItemJnlLine.Quantity + ItemJnlLine."Scrap Quantity";
    END;

    var
        PurchLineRec: Record 39;
        Machine: Record "Equipment B2B";
        WorkCenter: Record "Work Center";
        MachineCenter: Record "Machine Center";


}