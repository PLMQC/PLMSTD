table 33000905 "Work Sheet B2B"
{

    Caption = 'Work Sheet';
    DrillDownPageID = "Work Sheet List B2B";
    LookupPageID = "Work Sheet List B2B";

    fields
    {
        field(1; "Job Card No."; Code[20])
        {
            Caption = 'Job Card No.';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(2; "Machine ID"; Code[20])
        {
            Caption = 'Machine ID';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(3; "Line Type"; Code[20])
        {
            Caption = 'Line Type';
            DataClassification = CustomerContent;
            TableRelation = "Line Type B2B";

            trigger OnValidate();
            begin
                LineTypeRec.GET("Line Type");
                "Misc. Account" := LineTypeRec."Misc. Account";
                if LineTypeRec.Service then begin
                    PLMSetup.GET();
                    "I/R Code" := PLMSetup."G/L Account No.";
                    GLAcc.GET(PLMSetup."G/L Account No.");
                    "I/R Description" := GLAcc.Name;
                    "Line Type Values" := "Line Type Values"::Services;
                end;
                CheckLineType();
                UpdateLineType();
            end;
        }
        field(4; "I/R Code"; Code[20])
        {
            Caption = 'I/R Code';
            DataClassification = CustomerContent;

            trigger OnLookup();
            begin
                if Item.GET("I/R Code") then;
                if ResourceRec.GET("I/R Code") then;
                MachineSetup.GET();
                Item.RESET();
                SpareRec.RESET();
                ResourceRec.RESET();

                if LineType.GET("Line Type") then begin
                    if LineType."Spares & Consumables" then begin
                        SpareRec.SETRANGE("Machine ID", "Machine ID");
                        if PAGE.RUNMODAL(33000903, SpareRec) = ACTION::LookupOK then begin
                            Item.GET(SpareRec."Item ID");
                            "I/R Code" := Item."No.";
                            "I/R Description" := Item.Description;
                            UOM := Item."Base Unit of Measure";
                            "Unit Cost" := Item."Unit Cost";
                        end;
                    end;

                    if LineType."Resource Equipment" or LineType."Resource Person" then begin

                        if LineType."Resource Equipment" then
                            ResourceRec.SETRANGE(ResourceRec.Type, ResourceRec.Type::Machine)
                        else begin
                            ResourceRec.SETRANGE(ResourceRec.Type, ResourceRec.Type::Person);
                            PMResSkill.SETRANGE("Machine No.", "Machine ID");
                            if PMResSkill.FINDFIRST() then
                                repeat
                                    ResourceRec.GET(PMResSkill."No.");
                                    ResourceRec.MARK(true);
                                until PMResSkill.NEXT() = 0;

                            ResourceVar.SETRANGE("Skill Type B2B", ResourceVar."Skill Type B2B"::All);
                            ResourceVar.SETRANGE(Type, ResourceVar.Type::Person);
                            if ResourceVar.FINDFIRST() then
                                repeat
                                    ResourceRec.GET(ResourceVar."No.");
                                    ResourceRec.MARK(true);
                                until ResourceVar.NEXT() = 0;
                            ResourceRec.MARKEDONLY(true);
                        end;
                        if PAGE.RUNMODAL(0, ResourceRec) = ACTION::LookupOK then begin
                            "I/R Code" := ResourceRec."No.";
                            "I/R Description" := ResourceRec.Name;
                            UOM := ResourceRec."Base Unit of Measure";
                            "Unit Cost" := ResourceRec."Unit Cost";
                            Resource := true;
                        end;
                    end;
                end;
            end;

            trigger OnValidate();
            begin
                if Posted then
                    ERROR(Text004Lbl);


                TESTFIELD("Line Type");
                SpareRec.RESET();
                ResourceRec.RESET();

                if LineType.GET("Line Type") then
                    if LineType."Spares & Consumables" then
                        if Item.GET("I/R Code") then begin
                            "I/R Code" := Item."No.";
                            "I/R Description" := Item.Description;
                            UOM := Item."Base Unit of Measure";
                            "Unit Cost" := Item."Unit Cost";
                            "Spares & Consumables" := true;
                        end else
                            ERROR(Text005Lbl);
                if LineType.GET("Line Type") then
                    if LineType."Resource Equipment" or LineType."Resource Person" then begin
                        ResourceRec.SETRANGE("No.", "I/R Code");
                        if ResourceRec.GET("I/R Code") then begin
                            "I/R Code" := ResourceRec."No.";
                            "I/R Description" := ResourceRec.Name;
                            UOM := ResourceRec."Base Unit of Measure";
                            "Unit Cost" := ResourceRec."Unit Cost";
                            Resource := true;
                        end else
                            ERROR(Text006Lbl);
                    end;
                CheckPersons();
                Spare.RESET();
                Spare.SETRANGE(Spare."Item ID", "I/R Code");
                if Spare.FINDFIRST() then
                    UOM := Spare."Unit of Measure";
            end;
        }
        field(5; "I/R Description"; Text[100])
        {
            Caption = 'I/R Description';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(6; "Time Required"; Decimal)
        {
            Caption = 'Time Required';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                Amount := "Time Required" * "Unit Cost";
            end;
        }
        field(7; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                Amount := Quantity * "Unit Cost";
                LineType.RESET();
                LineType.SETRANGE(Code, "Line Type");
                if LineType.FINDFIRST() then
                    if LineType."Spares & Consumables" then
                        "Spares & Consumables" := true;
                VALIDATE(Amount);

                if Posted then
                    ERROR(Text004Lbl)
            end;
        }
        field(8; UOM; Code[10])
        {
            Caption = 'UOM';
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = IF ("Spares & Consumables" = CONST(true)) "Unit of Measure"
            ELSE
            IF (Resource = CONST(true)) "Resource Unit of Measure";
        }
        field(9; "Unit Cost"; Decimal)
        {
            Caption = 'Unit Cost';
            DataClassification = CustomerContent;
            Editable = true;

            trigger OnValidate();
            begin
                if Posted then
                    ERROR(Text004Lbl);

                if LineType.GET("Line Type") then
                    if (LineType."Resource Equipment") or (LineType."Resource Person") then
                        if "Time Required" = 0 then
                            Amount := Quantity * "Unit Cost"
                        else
                            Amount := "Time Required" * "Unit Cost"
                    else
                        Amount := Quantity * "Unit Cost";

                VALIDATE(Amount);
            end;
        }
        field(10; "Location Code"; Code[20])
        {
            Caption = 'Location Code';
            DataClassification = CustomerContent;
            TableRelation = Location;
        }
        field(19; Remarks; Text[250])
        {
            Caption = 'Remarks';
            DataClassification = CustomerContent;
        }
        field(20; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(21; Consumed; Boolean)
        {
            Caption = 'Consumed';
            DataClassification = CustomerContent;
        }
        field(26; Amount; Decimal)
        {
            Caption = 'Amount';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(29; Resource; Boolean)
        {
            Caption = 'Resource';
            DataClassification = CustomerContent;
        }
        field(30; "Spares & Consumables"; Boolean)
        {
            Caption = 'Spares & Consumables';
            DataClassification = CustomerContent;
        }
        field(35; "Misc. Account"; Code[10])
        {
            Caption = 'Misc. Account';
            DataClassification = CustomerContent;
            TableRelation = "G/L Account";
        }
        field(36; Posted; Boolean)
        {
            Caption = 'Posted';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(37; "Cost Posted"; Boolean)
        {
            Caption = 'Cost Posted';
            DataClassification = CustomerContent;
        }
        field(60; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate();
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(61; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

            trigger OnValidate();
            begin
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(68; Status; Option)
        {
            Caption = 'Status';
            Editable = false;
            DataClassification = CustomerContent;
            OptionCaption = 'Open,Released';
            OptionMembers = Open,Released;
        }
        field(69; "Inspection Type"; Code[20])
        {
            Caption = 'Inspection Type';
            DataClassification = CustomerContent;
            TableRelation = "Dimension Value";
        }
        field(70; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            DataClassification = CustomerContent;
            TableRelation = Vendor."No.";
        }
        field(71; "Invoice No."; Code[20])
        {
            Caption = 'Invoice No.';
            DataClassification = CustomerContent;
        }
        field(80; "Bin Code"; Code[20])
        {
            Caption = 'Bin Code';
            DataClassification = CustomerContent;
            TableRelation = Bin.Code WHERE("Location Code" = FIELD("Location Code"),
                                            "Item Filter" = FIELD("I/R Code"));
        }
        field(85; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = CustomerContent;
        }
        field(86; External; Boolean)
        {
            Caption = 'External';
            DataClassification = CustomerContent;
        }
        field(87; "Document Line No."; Integer)
        {
            Caption = 'Document Line No.';
            DataClassification = CustomerContent;
        }
        field(88; "Purchase Order No."; Code[20])
        {
            Caption = 'Purchase Order No.';
            DataClassification = CustomerContent;
        }
        field(89; "Inspection Type1"; Option)
        {
            Caption = 'Inspection Type1';
            OptionCaption = 'Internal,External';
            DataClassification = CustomerContent;
            OptionMembers = Internal,External;
        }
        field(90; "Purchase Order Line No."; Integer)
        {
            Caption = 'Purchase Order Line No.';
            DataClassification = CustomerContent;
        }
        field(91; "Assigned Job No."; Code[20])
        {
            Caption = 'Assigned Job No.';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(92; PostWorkSheet; Boolean)
        {
            Caption = 'PostWorkSheet';
            DataClassification = CustomerContent;
        }
        field(93; "Gen. Prod. Posting Group"; Code[10])
        {
            Caption = 'Gen. Prod. Posting Group';
            DataClassification = CustomerContent;
            TableRelation = "Gen. Product Posting Group";
        }
        field(94; "Job Posted"; Boolean)
        {
            Caption = 'Job Posted';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(95; "Line Type Values"; Option)
        {
            Caption = 'Line Type Values';
            DataClassification = CustomerContent;
            Editable = false;
            OptionCaption = 'Resource,Item,Services';
            OptionMembers = Resource,Item,Services;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            DataClassification = CustomerContent;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup();
            begin
                ShowDimensions();
            end;
        }
    }

    keys
    {
        key(Key1; "Job Card No.", "Machine ID", "Line No.")
        {
        }
        key(Key2; "Job Card No.", "Line Type")
        {
            SumIndexFields = Amount;
        }
        key(Key3; "Job Card No.", Resource, "Spares & Consumables")
        {
            SumIndexFields = Amount;
        }
        key(Key4; "Job Card No.", "Machine ID", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code")
        {
        }
        key(Key5; "Job Card No.", "Job Posted", Posted)
        {
            SumIndexFields = Amount;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        TESTFIELD(Posted, false);
        JobCard.RESET();
        JobCard.SETRANGE("No.", "Job Card No.");
        if JobCard.FIND('-') then begin
            JobCard."Total Cost" := 0;
            JobCard.MODIFY();
        end;
    end;

    trigger OnInsert();
    var
        PMJobHeader: Record "PM Job Header B2B";
    begin
        CheckPersons();

        PMJobHeader.GET("Job Card No.", "Machine ID");
        VALIDATE("Shortcut Dimension 1 Code", PMJobHeader."Shortcut Dimension 1 Code");
        VALIDATE("Shortcut Dimension 2 Code", PMJobHeader."Shortcut Dimension 2 Code");
        "Dimension Set ID" := PMJobHeader."Dimension Set ID";
    end;

    var
        Item: Record Item;
        ResourceRec: Record Resource;
        MachineVar: Record "Equipment B2B";
        WorkSheetLRec: Record "Work Sheet B2B";

        PMResSkill: Record "PM Resource Skill B2B";
        MachineSetup: Record "Plant Maintenance Setup B2B";
        LineType: Record "Line Type B2B";
        JobCard: Record "PM Job Header B2B";
        Spare: Record "Spare B2B";

        FADepBook: Record "FA Depreciation Book";
        FAPostGrpRec: Record "FA Posting Group";
        SpareRec: Record "Spare B2B";
        LineTypeRec: Record "Line Type B2B";
        ResJournalLine: Record "Res. Journal Line";
        PLMSetup: Record "Plant Maintenance Setup B2B";
        MachineRec: Record "Equipment B2B";
        WorkSheet: Record "Work Sheet B2B";
        ResourceVar: Record Resource;
        GLAcc: Record "G/L Account";
        ResJnlPostLine: Codeunit "Res. Jnl.-Post Line";

        DimMgt: Codeunit DimensionManagement;
        NoSerMgt: Codeunit NoSeriesManagement;
        Text001Lbl: Label 'Resource %1 is already assigned.', Comment = '%1 = I/R Code';
        RLineNo: Integer;
        LineNo: Integer;
        //PostedVar: Boolean;
        Text002Lbl: Label 'Do you want to post the journal lines?';
        Text003Lbl: Label 'The journal lines were successfully posted.';
        OldDimSetID: Integer;
        Text004Lbl: Label 'Work Sheet alredy posted.';
        Text005Lbl: Label 'Item No. does not exist';
        Text006Lbl: Label 'Resource No. does not exist';
        PInvTextLbl: Label 'P-INV';
        Text007Lbl: Label 'Purchase Invoice Created %1', Comment = '%1 = No.';
        Text008Lbl: Label 'Line type must not be Service.';
        CompanyTextLbl: Label 'COMPANY';
        GJnlTextLbl: Label 'GJNL-FA';

    procedure CreatePurchInv();
    var
        PurchHead: Record "Purchase Header";
        PurchLine: Record "Purchase Line";
    begin
        PurchHead.RESET();
        PurchHead.INIT();
        PurchHead."No." := NoSerMgt.GetNextNo(PInvTextLbl, TODAY(), true);
        PurchHead."Document Type" := PurchHead."Document Type"::Invoice;
        PurchHead.VALIDATE("Buy-from Vendor No.", "Vendor No.");
        PurchHead."Document Date" := TODAY();
        PurchHead."Shortcut Dimension 1 Code" := "Shortcut Dimension 1 Code";
        PurchHead."Shortcut Dimension 2 Code" := "Shortcut Dimension 2 Code";
        PurchHead.INSERT();

        PurchLine.INIT();
        PurchLine."Document No." := PurchHead."No.";
        PurchLine."Document Type" := PurchLine."Document Type"::Invoice;
        PurchLine."Line No." := 10000;
        PurchLine.Type := PurchLine."Type"::"Charge (Item)";
        PLMSetup.GET();
        PurchLine.VALIDATE("No.", PLMSetup."G/L Account No.");
        PurchLine.VALIDATE(Quantity, Quantity);
        PurchLine.VALIDATE("Unit Cost (LCY)", "Unit Cost");
        PurchLine.INSERT();
        MESSAGE(Text007Lbl, PurchHead."No.");
        "Invoice No." := PurchHead."No.";
        MODIFY();
    end;

    procedure CheckPersons();
    begin
        WorkSheet.RESET();
        WorkSheet.SETRANGE("I/R Code", "I/R Code");
        WorkSheet.SETRANGE(Posted, false);
        if WorkSheet.FINDFIRST() and (LineType."Resource Person") then
            repeat
                if WorkSheet."Job Card No." <> "Job Card No." then
                    GetError();
                if (WorkSheet."Job Card No." = "Job Card No.") and (WorkSheet."Line No." <> "Line No.") then
                    GetError();
            until WorkSheet.NEXT() = 0;
    end;

    procedure GetError();
    begin
        ERROR(Text001Lbl, "I/R Code");
    end;

    procedure CheckLineType();
    begin
        if LineType.Service then
            ERROR(Text008Lbl);
    end;

    procedure ShowDimensions();
    begin
        OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet(
            "Dimension Set ID", STRSUBSTNO('%1 %2', "Job Card No.", "Machine ID"),
            "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");

        if OldDimSetID <> "Dimension Set ID" then
            MODIFY();
    end;

    procedure InsertJrnlLineDim(ItemJrnlLine: Record "Item Journal Line");
    begin
    end;

    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20]);
    begin
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
    end;

    procedure UpdateMachineCost();
    var
        AmountL: Decimal;
    begin
        CLEAR(AmountL);
        MachineVar.GET("Machine ID");
        WorkSheetLRec.RESET();
        WorkSheetLRec.SETRANGE("Job Card No.", "Job Card No.");
        if WorkSheetLRec.FINDFIRST() then
            repeat
                AmountL += WorkSheetLRec.Amount;
            until WorkSheetLRec.NEXT() = 0;
        MachineVar.VALIDATE("Total Break Down Cost", MachineVar."Total Break Down Cost" + Amount);
        MachineVar.MODIFY(true);
    end;

    procedure Post();
    begin
        TESTFIELD("Shortcut Dimension 1 Code");
        TESTFIELD("Shortcut Dimension 2 Code");
        TESTFIELD(Status, Status::Released);
        TESTFIELD(Posted, false);
        /*if "Line Type Values" = "Line Type Values"::Item then
            PostItemJrnl
        else
            if "Line Type Values" = "Line Type Values"::Resource then
                PostResourceJrnl
            else
                if "Line Type Values" = "Line Type Values"::Services then
                    Posted := true
        */
        Case "Line Type Values" of
            "Line Type Values"::Item:
                PostItemJrnl();
            "Line Type Values"::Resource:
                PostResourceJrnl();
            "Line Type Values"::Services:
                Posted := true;//Change in variable from PosteeVar to Posted
        end;
        if Posted then//Change in variable from PosteeVar to Posted
            MODIFY();
    end;


    procedure PostItemJrnl();
    var
        ItemJnlLine: Record "Item Journal Line";
        ItemJnlPostLine: Codeunit "Item Jnl.-Post Line";

    begin
        PLMSetup.GET();
        LineNo := 10000;

        if not CONFIRM(Text002Lbl) then
            exit;

        ItemJnlLine.INIT();
        ItemJnlLine.VALIDATE("Journal Template Name", PLMSetup."Item Template");
        ItemJnlLine.VALIDATE("Journal Batch Name", PLMSetup."Item Journal Batch");
        ItemJnlLine.VALIDATE("Posting Date", WORKDATE());
        ItemJnlLine.VALIDATE("Document Date", WORKDATE());
        ItemJnlLine.VALIDATE("Document No.", "Job Card No.");
        ItemJnlLine."Line No." := LineNo;
        ItemJnlLine.VALIDATE("Entry Type", ItemJnlLine."Entry Type"::"Negative Adjmt.");
        ItemJnlLine.VALIDATE("Item No.", "I/R Code");
        ItemJnlLine.VALIDATE("Unit of Measure Code", UOM);
        ItemJnlLine.VALIDATE(Quantity, Quantity);
        ItemJnlLine."Machine Id B2B" := "Machine ID";
        ItemJnlLine.VALIDATE("Location Code", "Location Code");
        ItemJnlLine.VALIDATE("Bin Code", "Bin Code");
        ItemJnlLine."Post Worksheet B2B" := true;
        ItemJnlLine.VALIDATE("Shortcut Dimension 1 Code", "Shortcut Dimension 1 Code");
        ItemJnlLine.VALIDATE("Shortcut Dimension 2 Code", "Shortcut Dimension 2 Code");
        ItemJnlLine."Dimension Set ID" := "Dimension Set ID";
        InsertJrnlLineDim(ItemJnlLine);
        ItemJnlPostLine.RUN(ItemJnlLine);
        Posted := true;
        if Posted then
            MESSAGE(Text003Lbl);
    end;

    procedure PostResourceJrnl();
    begin
        RLineNo := 10000;
        PLMSetup.GET();

        if not CONFIRM(Text002Lbl) then
            exit;

        ResJournalLine.INIT();
        ResJournalLine.VALIDATE("Journal Template Name", PLMSetup."Resource Template");
        ResJournalLine.VALIDATE("Journal Batch Name", PLMSetup."Resource Journal Batch");
        ResJournalLine.VALIDATE("Posting Date", WORKDATE());
        ResJournalLine.VALIDATE("Document Date", WORKDATE());
        ResJournalLine.VALIDATE("Document No.", "Job Card No.");
        ResJournalLine."Line No." := RLineNo + 10000;
        ResJournalLine.VALIDATE("Entry Type", ResJournalLine."Entry Type"::Usage);
        ResJournalLine.Description := "Job Card No.";
        ResJournalLine.VALIDATE("Machine Id B2B", "Machine ID");
        ResJournalLine.VALIDATE("Resource No.", "I/R Code");
        ResJournalLine.VALIDATE("Unit of Measure Code", UOM);
        ResJournalLine.VALIDATE(Quantity, "Time Required");
        ResJournalLine.VALIDATE("Unit Cost", "Unit Cost");
        ResJournalLine.VALIDATE("Shortcut Dimension 1 Code", "Shortcut Dimension 1 Code");
        ResJournalLine.VALIDATE("Shortcut Dimension 2 Code", "Shortcut Dimension 2 Code");
        ResJnlPostLine.RunWithCheck(ResJournalLine);
        Posted := true;
        if Posted then
            MESSAGE(Text003Lbl);
    end;

    procedure PostService();
    var
        GenJnl: Record "Gen. Journal Line";
        NoSeriesMgtL: Codeunit NoSeriesManagement;
        FAPostGrp: Code[20];
    begin
        LineNo := 10000;
        GenJnl.INIT();
        GenJnl.VALIDATE("Journal Template Name", PLMSetup."Fixed Asset Template");
        GenJnl.VALIDATE("Journal Batch Name", PLMSetup."Fixed Asset Journal Batch");
        GenJnl.VALIDATE("Posting Date", WORKDATE());
        GenJnl.VALIDATE("Document Date", WORKDATE());
        GenJnl.VALIDATE("Document Type", 1);
        GenJnl.VALIDATE("Document No.", NoSeriesMgtL.GetNextNo(GJnlTextLbl, WORKDATE(), true));
        GenJnl."Line No." := LineNo;
        GenJnl."Machine Id B2B" := "Machine ID";
        GenJnl.VALIDATE("Account Type", 4);
        MachineRec.GET("Machine ID");
        GenJnl.VALIDATE("Account No.", MachineRec."Fixed Asset Code");
        GenJnl.VALIDATE("FA Posting Type", 8);
        GenJnl.VALIDATE(Quantity, Quantity);
        GenJnl.VALIDATE(Amount, Amount);
        GenJnl.VALIDATE("Shortcut Dimension 1 Code", "Shortcut Dimension 1 Code");
        GenJnl.VALIDATE("Shortcut Dimension 2 Code", "Shortcut Dimension 2 Code");
        FADepBook.SETRANGE("FA No.", MachineRec."Fixed Asset Code");
        FADepBook.SETRANGE("Depreciation Book Code", CompanyTextLbl);
        if FADepBook.FINDFIRST() then begin
            FAPostGrp := FADepBook."FA Posting Group";
            FAPostGrpRec.SETRANGE(Code, FAPostGrp);
            if FAPostGrpRec.FINDFIRST() then
                GenJnl.VALIDATE(GenJnl."Bal. Account No.", FAPostGrpRec."Maintenance Expense Account");
        end;
        CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post", GenJnl);
    end;

    procedure UpdateLineType();
    var
        LineLType: Record "Line Type B2B";
    begin
        LineLType.GET("Line Type");
        if LineLType."Resource Equipment" or LineLType."Resource Person" then
            "Line Type Values" := "Line Type Values"::Resource
        else
            if LineLType."Spares & Consumables" then
                "Line Type Values" := "Line Type Values"::Item
            else
                if LineLType.Service then
                    "Line Type Values" := "Line Type Values"::Services;
    end;

    procedure OpenItemTrackingLines(IsReclass: Boolean);
    var
        ReserveItemJnlLine: Codeunit "PLMMethods B2B";
    begin
        ReserveItemJnlLine.CallItemTrackingPLM(Rec, false);
    end;
}

