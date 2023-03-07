table 33000934 "SubCon WorkSheet B2B"
{

    Caption = 'SubCon WorkSheet';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Job Card No."; Code[20])
        {
            Caption = 'Job Card No.';
            DataClassification = CustomerContent;

        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;

        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;

        }
        field(4; "Job Card Line No."; Integer)
        {
            Caption = 'Job Card Line No.';
            DataClassification = CustomerContent;

        }
        field(5; "Unit of Measure"; Code[10])
        {
            Caption = 'Unit of Measure';
            TableRelation = "Unit of Measure";
            DataClassification = CustomerContent;

        }
        field(7; "Unit Rate"; Decimal)
        {
            Caption = 'Unit Rate';
            DataClassification = CustomerContent;

        }
        field(8; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = CustomerContent;


            trigger OnValidate();
            begin
                Amount := Quantity * "Unit Rate";
            end;
        }
        field(9; Amount; Decimal)
        {
            Caption = 'Amount';
            DataClassification = CustomerContent;

        }
        field(10; "Purchase Order No."; Code[20])
        {
            Caption = 'Purchase Order No.';
            DataClassification = CustomerContent;

        }
        field(11; Posted; Boolean)
        {
            Caption = 'Posted';
            DataClassification = CustomerContent;

        }
        field(12; External; Boolean)
        {
            Caption = 'External';
            TableRelation = IF (External = CONST(true)) Vendor."No.";
            DataClassification = CustomerContent;

        }
        field(18; "Inspection Type"; Code[20])
        {
            Caption = 'Inspection Type';
            TableRelation = "Maintenance Type B2B";
            DataClassification = CustomerContent;


            trigger OnValidate();
            begin
                PMJobRec2.RESET();
                PMJobRec2.SETRANGE("No.", "Job Card No.");
                PMJobRec2.SETFILTER("Purchase Order No.", '%1', '');
                PMJobRec2.SETFILTER("Purchase Invoice No.", '%1', '');
                if PMJobRec2.FINDFIRST() then begin
                    PMJobRec2."Maintenance Type" := "Inspection Type";
                    PMJobRec2.MODIFY();
                    PMJobLineRec2.RESET();
                    PMJobLineRec2.SETRANGE("Job Header No.", "Job Card No.");
                    if PMJobLineRec2.FINDFIRST() then
                        repeat
                            PMJobLineRec2.VALIDATE("Maintenace Type", "Inspection Type");
                            PMJobLineRec2.MODIFY();
                        until PMJobLineRec2.NEXT() = 0;
                    InspTypeRec.RESET();
                    InspTypeRec.SETRANGE(Code, "Inspection Type");
                    if InspTypeRec.FINDFIRST() then begin
                        ;
                        if InspTypeRec.External = true then
                            External := true
                        else
                            if InspTypeRec.External = false then begin
                                External := false;
                                "Vendor No." := '';
                            end;
                    end;
                end else
                    ERROR(Text007Lbl);
            end;
        }
        field(19; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            TableRelation = Vendor;
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                PMJobRec.SETRANGE("No.", "Job Card No.");
                if PMJobRec.FINDFIRST() then begin
                    PMJobRec."Vendor No." := "Vendor No.";
                    PMJobRec.MODIFY();
                end;

                WorkSheetRecGlbl.SETRANGE("Job Card No.", "Job Card No.");
                WorkSheetRecGlbl.SETRANGE(External, true);
                WorkSheetRecGlbl.SETRANGE("Line Type", ExtSourceTxt);
                if WorkSheetRecGlbl.FINDFIRST() then begin
                    WorkSheetRecGlbl."Vendor No." := "Vendor No.";
                    WorkSheetRecGlbl.MODIFY();
                end;
            end;
        }
        field(25; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = 'Order,Invoice';
            OptionMembers = "Order",Invoice;
            DataClassification = CustomerContent;
        }
        field(30; "Carry Out"; Boolean)
        {
            Caption = 'Carry Out';
            DataClassification = CustomerContent;
        }
        field(34; "Purchase Invoice No."; Code[20])
        {
            Caption = 'Purchase Invoice No.';
            DataClassification = CustomerContent;
        }
        field(40; "Service Type"; Option)
        {
            Caption = 'Service Type';
            Editable = false;
            OptionCaption = 'PMR,BreakDown,Other,predictive';
            OptionMembers = PMR,BreakDown,Other,predictive;
            DataClassification = CustomerContent;
        }
        field(45; "Machine Id"; Code[20])
        {
            Caption = 'Machine Id';
            DataClassification = CustomerContent;
        }
        field(46; "WorkSheet Line No."; Integer)
        {
            Caption = 'WorkSheet Line No.';
            DataClassification = CustomerContent;
        }
        field(50; Date; Date)
        {
            Caption = 'Date';
            DataClassification = CustomerContent;
        }
        field(55; Resource; Boolean)
        {
            Caption = 'Resource';
            DataClassification = CustomerContent;
        }
        field(56; Spares; Boolean)
        {
            Caption = 'Spares';
            DataClassification = CustomerContent;
        }
        field(57; "Purchase Order Line No."; Integer)
        {
            Caption = 'Purchase Order Line No.';
            DataClassification = CustomerContent;
        }
        field(58; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = "  ",Created;
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Job Card No.", "Line No.")
        {
        }
        key(Key2; "Vendor No.")
        {
        }
    }

    fieldgroups
    {
    }

    var
        PMJobRec: Record "PM Job Header B2B";
        VendRec: Record Vendor;
        PurchaseHeaderOrder: Record "Purchase Header";
        PPSetup: Record "Purchases & Payables Setup";
        InspTypeRec: Record "Maintenance Type B2B";
        PMJobRec2: Record "PM Job Header B2B";
        PLMaintSetup: Record "Plant Maintenance Setup B2B";

        PMSetup: Record "Plant Maintenance Setup B2B";
        PurchaseLineOrder: Record "Purchase Line";
        PMJobLineRec2: Record "PM Job Line B2B";
        PMJobLine: Record "PM Job Line B2B";
        SubConWorkShtLRec: Record "SubCon WorkSheet B2B";
        MachLRec: Record "Equipment B2B";
        WorkSheetRec: Record "Work Sheet B2B";

        JobCardRec: Record "PM Job Header B2B";
        WorkSheetRecGlbl: Record "Work Sheet B2B";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Text004Lbl: Label 'Do you want post Sub Contracting Worksheet Lines ?';
        Text005Lbl: Label 'Purchase Order Created %1 and Line inserted in the Worksheet.', Comment = '%1 = No.';
        Text006Lbl: Label 'Carry out is needs to be checked.';
        PurchOrderLineNo: Integer;
        Text007Lbl: Label 'Document already created';
        ServiceTextLbl: Label 'SERVICE';
        ExtSourceTxt: Label 'EXT. SOURCE';

    procedure CreatePurchaseDocument();
    var
        PrevVendNo: Code[20];
    begin
        PLMaintSetup.GET();
        CLEAR(PrevVendNo);
        TestField("Vendor No.");
        IF NOT "Carry Out" THEN
            ERROR(Text006Lbl);
        IF NOT CONFIRM(Text004Lbl, FALSE) THEN
            EXIT;

        SubConWorkShtLRec.RESET();
        SubConWorkShtLRec.SETCURRENTKEY("Vendor No.");
        SubConWorkShtLRec.SETRANGE("Carry Out", TRUE);
        SubConWorkShtLRec.SETRANGE(Posted, FALSE);
        IF SubConWorkShtLRec.FINDFIRST() THEN
            REPEAT
                IF PrevVendNo <> SubConWorkShtLRec."Vendor No." THEN BEGIN
                    PurchOrderLineNo := 10000;
                    PPSetup.GET();
                    PurchaseHeaderOrder.INIT();
                    IF SubConWorkShtLRec."Document Type" = SubConWorkShtLRec."Document Type"::Order THEN BEGIN
                        PurchaseHeaderOrder."Document Type" := PurchaseHeaderOrder."Document Type"::Order;
                        PurchaseHeaderOrder."No." := NoSeriesMgt.GetNextNo(PPSetup."Order Nos.", WORKDATE(), TRUE);
                    END ELSE BEGIN
                        PurchaseHeaderOrder."Document Type" := PurchaseHeaderOrder."Document Type"::Invoice;
                        PurchaseHeaderOrder."No." := NoSeriesMgt.GetNextNo(PPSetup."Invoice Nos.", WORKDATE(), TRUE);
                    END;

                    PurchaseHeaderOrder."Order Date" := WORKDATE();
                    PurchaseHeaderOrder."Posting Date" := WORKDATE();
                    PurchaseHeaderOrder."Document Date" := WORKDATE();
                    PurchaseHeaderOrder.VALIDATE("Buy-from Vendor No.", SubConWorkShtLRec."Vendor No.");
                    PurchaseHeaderOrder."Job Card No. B2B" := SubConWorkShtLRec."Job Card No.";
                    PurchaseHeaderOrder."Machine Id B2B" := SubConWorkShtLRec."Machine Id";

                    PurchaseHeaderOrder.INSERT(TRUE);
                    MESSAGE(Text005Lbl, PurchaseHeaderOrder."No.");

                    MachLRec.RESET();
                    MachLRec.SETRANGE("No.", SubConWorkShtLRec."Machine Id");
                    IF MachLRec.FINDFIRST() THEN BEGIN
                        PurchaseHeaderOrder.VALIDATE("Shortcut Dimension 1 Code", MachLRec."Shortcut Dimension 1 Code");
                        PurchaseHeaderOrder.VALIDATE("Shortcut Dimension 2 Code", MachLRec."Shortcut Dimension 2 Code");
                        PurchaseHeaderOrder.MODIFY();
                    END;
                END;


                PurchaseLineOrder.INIT();
                PurchaseLineOrder."Document Type" := PurchaseHeaderOrder."Document Type";
                PurchaseLineOrder."Document No." := PurchaseHeaderOrder."No.";
                PurchaseLineOrder."Line No." := PurchOrderLineNo;
                PurchaseLineOrder.VALIDATE("Buy-from Vendor No.", PurchaseHeaderOrder."Buy-from Vendor No.");
                PurchaseLineOrder.VALIDATE(Type, PurchaseLineOrder.Type::"G/L Account");

                PMSetup.GET();
                PMSetup.TESTFIELD("G/L Account No.");
                VendRec.GET(SubConWorkShtLRec."Vendor No.");
                PurchaseLineOrder.VALIDATE("No.", VendRec."G/L Account No. B2B");
                IF VendRec."G/L Account No. B2B" = '' THEN
                    PurchaseLineOrder.VALIDATE("No.", PMSetup."G/L Account No.");
                PurchaseLineOrder.VALIDATE(Quantity, SubConWorkShtLRec.Quantity);
                PurchaseLineOrder.VALIDATE("Direct Unit Cost", SubConWorkShtLRec."Unit Rate");
                PurchaseLineOrder.Description := SubConWorkShtLRec.Description;
                PurchaseLineOrder."Machine Id B2B" := SubConWorkShtLRec."Machine Id";
                PurchaseLineOrder."Job Card No. B2B" := SubConWorkShtLRec."Job Card No.";
                PurchaseLineOrder."Buy-from Vendor No." := SubConWorkShtLRec."Vendor No.";
                PurchaseLineOrder.Quantity := SubConWorkShtLRec.Quantity;
                PurchaseLineOrder."Direct Unit Cost" := SubConWorkShtLRec."Unit Rate";
                PurchaseLineOrder."Line Amount" := SubConWorkShtLRec.Amount;
                WorkSheetRec.RESET();
                WorkSheetRec.SETRANGE("Job Card No.", SubConWorkShtLRec."Job Card No.");
                IF WorkSheetRec.FINDFIRST() THEN
                    PurchaseLineOrder."Reference No. B2B" := WorkSheetRec."Line No.";

                PurchaseLineOrder.INSERT(TRUE);

                MachLRec.RESET();
                MachLRec.SETRANGE("No.", SubConWorkShtLRec."Machine Id");
                IF MachLRec.FINDFIRST() THEN BEGIN
                    PurchaseLineOrder."Shortcut Dimension 1 Code" := MachLRec."Shortcut Dimension 1 Code";
                    PurchaseLineOrder."Shortcut Dimension 2 Code" := MachLRec."Shortcut Dimension 2 Code";
                    PurchaseLineOrder.MODIFY();
                END;
                PurchOrderLineNo += 10000;

                SubConWorkShtLRec.Posted := TRUE;
                SubConWorkShtLRec."Purchase Order No." := PurchaseHeaderOrder."No.";
                SubConWorkShtLRec."Purchase Order Line No." := PurchOrderLineNo;
                SubConWorkShtLRec.MODIFY(TRUE);


                WorkSheetRec.RESET();
                WorkSheetRec.SETRANGE("Job Card No.", SubConWorkShtLRec."Job Card No.");
                WorkSheetRec.SETRANGE("Machine ID", SubConWorkShtLRec."Machine Id");
                IF WorkSheetRec.FINDLAST() THEN;


                WorkSheetRec.INIT();
                WorkSheetRec."Job Card No." := SubConWorkShtLRec."Job Card No.";
                WorkSheetRec."Machine ID" := SubConWorkShtLRec."Machine Id";
                WorkSheetRec."Line No." := WorkSheetRec."Line No." + 10000;
                WorkSheetRec."Document Line No." := PMJobLine."Line No.";
                WorkSheetRec."Line Type" := ServiceTextLbl;
                IF VendRec."G/L Account No. B2B" <> '' THEN
                    WorkSheetRec."I/R Code" := VendRec."G/L Account No. B2B"
                ELSE
                    WorkSheetRec."I/R Code" := PLMaintSetup."G/L Account No.";

                IF WorkSheetRec."Line Type" = ServiceTextLbl THEN
                    WorkSheetRec."Line Type Values" := WorkSheetRec."Line Type Values"::Services;

                WorkSheetRec."Vendor No." := SubConWorkShtLRec."Vendor No.";
                WorkSheetRec.Quantity := SubConWorkShtLRec.Quantity;
                WorkSheetRec."Unit Cost" := SubConWorkShtLRec."Unit Rate";
                WorkSheetRec.Amount := SubConWorkShtLRec.Amount;
                WorkSheetRec.External := TRUE;
                WorkSheetRec."Inspection Type1" := 1;
                WorkSheetRec."Purchase Order No." := PurchaseHeaderOrder."No.";
                WorkSheetRec."Purchase Order Line No." := PurchOrderLineNo;
                JobCardRec.RESET();
                JobCardRec.SETRANGE("No.", WorkSheetRec."Job Card No.");
                JobCardRec.SETRANGE("Machine ID", WorkSheetRec."Machine ID");
                IF JobCardRec.FINDFIRST() THEN BEGIN
                    WorkSheetRec."Shortcut Dimension 1 Code" := JobCardRec."Shortcut Dimension 1 Code";
                    WorkSheetRec."Shortcut Dimension 2 Code" := JobCardRec."Shortcut Dimension 2 Code";
                END;
                WorkSheetRec.INSERT();

                PrevVendNo := SubConWorkShtLRec."Vendor No.";

            UNTIL SubConWorkShtLRec.NEXT() = 0;

    end;

    /*procedure "Get SubContract Lines"();
    begin
        if MachNameVar <> '' then
            PMJobHeaderRec.SETRANGE("Machine ID", MachNameVar);
    end;*/
}

