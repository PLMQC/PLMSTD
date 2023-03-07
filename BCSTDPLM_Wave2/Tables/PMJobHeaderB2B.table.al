table 33000903 "PM Job Header B2B"
{

    Caption = 'PM Job Header';
    DrillDownPageID = "PM Job List B2B";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = "PM Job Line B2B"."Job Header No.";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if "No." <> xRec."No." then begin
                    MachineSetup.GET();
                    NoSeriesMgt.TestManual(MachineSetup."PMR Job Card");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Machine ID"; Code[20])
        {
            Caption = 'Machine ID';
            DataClassification = CustomerContent;
            TableRelation = "Equipment B2B";

            trigger OnValidate();
            var
                Machine: Record "Equipment B2B";
            begin
                if Machine.GET("Machine ID") then
                    "Machine Name" := Machine.Name
                else
                    "Machine Name" := '';

                EquipmentGRec.SETRANGE("No.", "Machine ID");
                if EquipmentGRec.FINDFIRST() then
                    Resource := EquipmentGRec.Resource;
            end;
        }
        field(3; "Machine Name"; Text[50])
        {
            Caption = '" Name"';
            Editable = false;
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        field(7; "Frequency Name"; Text[50])
        {
            Caption = 'Frequency Name';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(16; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
        }
        field(20; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'PMR,BreakDown,Others,Predictive';
            OptionMembers = PMR,BreakDown,Others,Predictive;
            DataClassification = CustomerContent;
        }
        field(31; "Expected Resource Cost"; Decimal)
        {
            CalcFormula = Sum("PM Job OP Particulars B2B".Amount WHERE("Job Card No." = FIELD("No."),
                                                                           Resource = CONST(true)));
            Caption = 'Planned Resource Cost';
            Editable = false;
            FieldClass = FlowField;
        }
        field(32; "Expected Spares Cost"; Decimal)
        {
            CalcFormula = Sum("PM Job OP Particulars B2B".Amount WHERE("Job Card No." = FIELD("No."),
                                                                           "Spares & Consumables" = CONST(true)));
            Caption = 'Planned Spares Cost';
            Editable = false;
            FieldClass = FlowField;
        }
        field(49; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = CustomerContent;
        }
        field(50; Posted; Boolean)
        {
            Caption = 'Posted';
            DataClassification = CustomerContent;
            Editable = true;
        }
        field(51; "Created Date"; Date)
        {
            Caption = 'Created Date';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(52; "Created By"; Code[50])
        {
            Caption = 'Created By';
            Editable = false;
            DataClassification = CustomerContent;
            TableRelation = User;
        }
        field(53; "Posted Date"; Date)
        {
            Caption = 'Posted Date';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(54; "Posted By"; Code[50])
        {
            Caption = 'Posted By';
            Editable = false;
            DataClassification = CustomerContent;
            TableRelation = User;
        }
        field(55; "Actual Resource Cost"; Decimal)
        {
            CalcFormula = Sum("Work Sheet B2B".Amount WHERE("Job Card No." = FIELD("No."),
                                                         Resource = FILTER(true)));
            Caption = 'Actual Resource Cost';
            Editable = false;
            FieldClass = FlowField;
        }
        field(56; "Actual Spares Cost"; Decimal)
        {
            CalcFormula = Sum("Work Sheet B2B".Amount WHERE("Job Card No." = FIELD("No."),
                                                         "Spares & Consumables" = FILTER(true)));
            Caption = 'Actual Spares Cost';
            Editable = false;
            FieldClass = FlowField;
        }
        field(57; "Complaint No."; Code[20])
        {
            Caption = 'Complaint No.';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(58; "Start Date Time"; DateTime)
        {
            Caption = 'Start Date Time';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin

                TESTFIELD(Status, Status::Open);
                "End Date Time" := 0DT;
            end;
        }
        field(59; "End Date Time"; DateTime)
        {
            Caption = 'End Date Time';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                TESTFIELD(Status, Status::Open);

                DateTimeValidations();
            end;
        }
        field(60; "Total Minutes"; Decimal)
        {
            Caption = 'Total Minutes';
            DataClassification = CustomerContent;
        }
        field(61; "Time Duration"; Duration)
        {
            Caption = 'Time Duration';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(62; "Total Cost"; Decimal)
        {
            Caption = 'Total Cost';
            DataClassification = CustomerContent;
            Editable = false;
            FieldClass = Normal;
        }
        field(63; UOM; Code[10])
        {
            Caption = 'UOM';
            TableRelation = "Capacity Unit of Measure";
            DataClassification = CustomerContent;
        }
        field(64; "Time(Hrs)"; Decimal)
        {
            Caption = 'Time(Hrs)';
            DataClassification = CustomerContent;
            DecimalPlaces = 2 : 2;
            Editable = false;
        }
        field(70; Consumed; Boolean)
        {
            Caption = 'Consumed';
            DataClassification = CustomerContent;
        }
        field(71; "Failure Code"; Code[20])
        {
            Caption = 'Failure Code';
            TableRelation = "Failure Type B2B";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                CheckStatus();
                FailureType.RESET();
                FailureType.GET("Failure Code");
                "Failure Description" := FailureType.Description;
            end;
        }
        field(72; "Failure Description"; Text[50])
        {
            Caption = 'Failure Description';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(75; "Created Time"; Time)
        {
            Caption = 'Created Time';
            DataClassification = CustomerContent;
        }
        field(80; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            DataClassification = CustomerContent;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(81; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            DataClassification = CustomerContent;
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(85; Comment; Boolean)
        {
            Caption = 'Comment';
            DataClassification = CustomerContent;
        }
        field(88; Status; Option)
        {
            Caption = 'Status';
            DataClassification = CustomerContent;
            Editable = false;
            OptionCaption = 'Open,Released';
            OptionMembers = Open,Released;

            trigger OnValidate();
            begin
                CheckStatus();
            end;
        }
        field(95; "Maintenance Type"; Code[20])
        {
            Caption = 'Maintenance Type';
            DataClassification = CustomerContent;
            TableRelation = "Maintenance Type B2B";

            trigger OnValidate();
            begin
                CheckStatus();
                UpdateMaintenanceType();
            end;
        }
        field(96; External; Boolean)
        {
            Caption = 'External';
            DataClassification = CustomerContent;
        }
        field(97; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            DataClassification = CustomerContent;
            TableRelation = IF (External = CONST(true)) Vendor."No.";

            trigger OnValidate();
            begin
                VendRec.GET("No.");
                "Vendor Name" := VendRec.Name;
            end;
        }
        field(98; "Vendor Name"; Text[100])
        {
            Caption = 'Vendor Name';
            DataClassification = CustomerContent;
        }
        field(99; "Purchase Order No."; Code[20])
        {
            Caption = 'Purchase Order No.';
            DataClassification = CustomerContent;
        }
        field(100; "Purchase Invoice No."; Code[20])
        {
            Caption = 'Purchase Invoice No.';
            DataClassification = CustomerContent;
        }
        field(101; "P.O. Date"; Date)
        {
            Caption = 'P.O. Date';
            DataClassification = CustomerContent;
        }
        field(102; "Work Center"; Code[20])
        {
            Caption = 'Work Center';
            DataClassification = CustomerContent;
            Editable = true;
            TableRelation = "Maintenance Work Centers B2B";
        }
        field(103; "Maintenance Date"; Date)
        {
            Caption = 'Maintenance Date';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(104; "Maintenance Unit"; Code[20])
        {
            Caption = 'Maintenance Unit';
            TableRelation = "Maintenance Unit B2B";
            DataClassification = CustomerContent;
        }
        field(105; "Plant ID"; Code[20])
        {
            Caption = 'Plant ID';
            DataClassification = CustomerContent;
        }
        field(106; "Other Description"; Code[50])
        {
            Caption = 'Other Description';
            DataClassification = CustomerContent;
        }
        field(107; "Test Description"; Code[30])
        {
            Caption = 'Test Description';
            DataClassification = CustomerContent;
        }
        field(108; Originator; Text[50])
        {
            Caption = 'Originator';
            DataClassification = CustomerContent;
        }
        field(109; "Contact Man"; Text[50])
        {
            Caption = 'Contact Man';
            DataClassification = CustomerContent;
        }
        field(110; "A.M.C"; Option)
        {
            Caption = 'A.M.C';
            Editable = false;
            OptionCaption = '" ,Yes,No"';
            DataClassification = CustomerContent;
            OptionMembers = " ",Yes,No;
        }
        field(111; Warranty; Option)
        {
            Caption = 'Warranty';
            Editable = false;
            OptionCaption = '" ,Yes,No"';
            DataClassification = CustomerContent;
            OptionMembers = " ",Yes,No;
        }
        field(112; Resource; Code[20])
        {
            Caption = 'Resource';
            DataClassification = CustomerContent;
        }
        field(113; "Estimated Time"; Decimal)
        {
            Caption = 'Estimated Time';
            DataClassification = CustomerContent;
        }
        field(114; "Planned Total Cost"; Decimal)
        {
            Caption = 'Planned Total Cost';
            DataClassification = CustomerContent;
        }
        field(115; "Meter Reading"; Decimal)
        {
            Caption = 'Meter Reading';
            DataClassification = CustomerContent;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = "Dimension Set Entry";
        }
    }

    keys
    {
        key(Key1; "No.", "Machine ID")
        {
        }
        key(Key2; "Machine ID")
        {
            SumIndexFields = "Total Minutes";
        }
        key(Key3; Type)
        {
            SumIndexFields = "Total Minutes";
        }
        key(Key4; "Machine ID", Posted, Status)
        {
        }
        key(Key5; "Frequency Name", "Machine ID")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        PMJobLine.RESET();
        PMJobLine.SETRANGE("Job Header No.", "No.");
        if PMJobLine.FIND('-') then
            PMJobLine.DELETEALL();

        JobOperation.RESET();
        JobOperation.SETRANGE("Job Card No.", "No.");
        if JobOperation.FIND('-') then
            JobOperation.DELETEALL();

        WorkSheet.RESET();
        WorkSheet.SETRANGE("Job Card No.", "No.");
        if WorkSheet.FIND('-') then
            WorkSheet.DELETEALL();
    end;

    trigger OnInsert();
    var
        Machine: Record "Equipment B2B";
    begin
        if "No." = '' then begin
            MachineSetup.GET();
            MachineSetup.TESTFIELD(MachineSetup."PMR Job Card");
            NoSeriesMgt.InitSeries(MachineSetup."PMR Job Card", xRec."No. Series", 0D, "No.", "No. Series");
        end;
        Machine.GET("Machine ID");
        VALIDATE("Shortcut Dimension 1 Code", Machine."Shortcut Dimension 1 Code");
        VALIDATE("Shortcut Dimension 2 Code", Machine."Shortcut Dimension 2 Code");
        "Dimension Set ID" := Machine."Dimension Set ID";
        TESTFIELD("Shortcut Dimension 1 Code");
        TESTFIELD("Shortcut Dimension 2 Code");
    end;

    var
        MachineSetup: Record "Plant Maintenance Setup B2B";
        PMJobLine: Record "PM Job Line B2B";
        EquipmentJournalsRec: Record "Equipment Journals B2B";
        ResJournalLine: Record "Res. Journal Line";
        ItemJnlLine: Record "Item Journal Line";
        CapacityUOM: Record "Capacity Unit of Measure";
        WorkSheet: Record "Work Sheet B2B";
        JobOperation: Record "PM Job OP Particulars B2B";
        EquipmentJournals: Record "Equipment Journals B2B";
        PLMSetupRec: Record "Plant Maintenance Setup B2B";
        SubconWorkSheet: Record "SubCon WorkSheet B2B";
        PMJobLineRec: Record "PM Job Line B2B";
        SubconWorkSheet1: Record "SubCon WorkSheet B2B";
        EquipmentGRec: Record "Equipment B2B";
        // MaintenanceTypeGrec: Record "Maintenance Type B2B";
        MachineRec: Record "Equipment B2B";
        FailureType: Record "Failure Type B2B";
        VendRec: Record Vendor;
        ItemJnlPostLine: Codeunit "Item Jnl.-Post Line";
        ResJnlPost: Codeunit "Res. Jnl.-Post";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        RelPLMDoc: Codeunit "Release PLM Document B2B";
        Text001Lbl: Label 'Consumption''s posted aganist Job Card %1', Comment = '%1 = No.';
        Text002Lbl: Label 'Entries already Posted or WorkSheet not entered';
        LineNo: Integer;
        RLineNo: Integer;
        EntryPosted: Boolean;
        Text0001Lbl: Label 'Do you want to insert Lines in sub contracting work sheet?';
        Text0002Lbl: Label 'Sub contracting lines are already created.';
        Text0009Lbl: Label 'Work sheet lines exist. Do you want to delete the line ?';
        Text0012Lbl: Label 'EXTERNAL';
        Text0013Lbl: Label 'INTERNAL';
        Text0010Lbl: Label 'Do you want to insert lines into Worksheet..?';

    procedure PostConsumption(JobCardHeader: Record "PM Job Header B2B");
    begin
        ItemJnlLine.SETRANGE("Journal Template Name", PLMSetupRec."Item Template");
        ItemJnlLine.SETRANGE("Journal Batch Name", PLMSetupRec."Item Journal Batch");
        if ItemJnlLine.FIND('-') then
            ItemJnlLine.DELETEALL();

        LineNo := 0;
        EntryPosted := false;

        WorkSheet.RESET();
        WorkSheet.SETRANGE("Job Card No.", JobCardHeader."No.");
        WorkSheet.SETRANGE("Spares & Consumables", true);
        WorkSheet.SETRANGE(Consumed, false);
        if WorkSheet.FIND('-') then
            repeat
                PLMSetupRec.GET();
                EntryPosted := false;
                WorkSheet.TESTFIELD("I/R Code");
                WorkSheet.TESTFIELD("Location Code");
                WorkSheet.TESTFIELD(Quantity);
                ItemJnlLine.INIT();
                ItemJnlLine."Journal Template Name" := PLMSetupRec."Item Template";
                ItemJnlLine."Journal Batch Name" := PLMSetupRec."Item Journal Batch";
                ItemJnlLine."Posting Date" := WORKDATE();
                ItemJnlLine."Document Date" := WORKDATE();
                ItemJnlLine."Document No." := WorkSheet."Job Card No.";
                ItemJnlLine."Line No." := LineNo + 10000;
                ;
                ItemJnlLine."Entry Type" := ItemJnlLine."Entry Type"::"Negative Adjmt.";
                ItemJnlLine.VALIDATE("Item No.", WorkSheet."I/R Code");
                ItemJnlLine.VALIDATE(Quantity, WorkSheet.Quantity);
                ItemJnlLine.VALIDATE("Unit of Measure Code", WorkSheet.UOM);
                ItemJnlLine.VALIDATE("Location Code", WorkSheet."Location Code");
                ItemJnlLine.VALIDATE(Amount, WorkSheet."Unit Cost");
                ItemJnlLine."Machine Id B2B" := WorkSheet."Machine ID";
                LineNo := LineNo + 10000;
                EntryPosted := true;
                ItemJnlLine.INSERT();
                ItemJnlLine.VALIDATE("Shortcut Dimension 1 Code", JobCardHeader."Shortcut Dimension 1 Code");
                ItemJnlLine.VALIDATE("Shortcut Dimension 2 Code", JobCardHeader."Shortcut Dimension 2 Code");
                ItemJnlLine.MODIFY();
                ItemJnlPostLine.RUN(ItemJnlLine);
                WorkSheet.Consumed := true;
                WorkSheet.Posted := true;
                WorkSheet.MODIFY();
            until WorkSheet.NEXT() = 0;

        if EntryPosted = true then
            MESSAGE(Text001Lbl, WorkSheet."Job Card No.")
        else
            MESSAGE(Text002Lbl);
    end;

    procedure PostEquipmentJournal(var JobCard: Record "PM Job Header B2B");
    var
        IsPostedlocal: Boolean;
    begin
        if not JobCard.Consumed then begin
            EquipmentJournals.DELETEALL();
            EquipmentJournals.LOCKTABLE();
            EquipmentJournals.INIT();
            EquipmentJournals.VALIDATE("Journal Template Name", PLMSetupRec."Equipment Template");
            EquipmentJournals.VALIDATE("Journal Batch Name", PLMSetupRec."Equipment Journal Batch");
            EquipmentJournals."Line No." := 10000;
            EquipmentJournals.VALIDATE("Machine No.", "Machine ID");
            EquipmentJournals.VALIDATE("Document No.", "No.");
            EquipmentJournals.VALIDATE("Posting Date", WORKDATE());
            EquipmentJournals."Start Date Time" := "Start Date Time";
            EquipmentJournals."End Date Time" := "End Date Time";
            EquipmentJournals."Total Minutes" := "Total Minutes";
            EquipmentJournals."Time(Hrs)" := "Time(Hrs)";
            EquipmentJournals."Time Duration" := "Time Duration";
            EquipmentJournals.VALIDATE("P/B Type", Type);
            EquipmentJournals.Type := EquipmentJournals.Type::"Stop Time";
            EquipmentJournals.INSERT();
            EquipmentJournalsRec.RESET();
            EquipmentJournals.RESET();
            EquipmentJournalsRec.PostJournals(EquipmentJournals, IsPostedlocal);
            JobCard.Consumed := true;
        end;
    end;

    procedure CalculateTimeinHrs();
    begin
        CapacityUOM.SETRANGE(Code, UOM);
        if CapacityUOM.FIND('-') then begin
            CapacityUOM.TESTFIELD(Type);
            /*
            if CapacityUOM.Type = CapacityUOM.Type::Hours then
                "Time(Hrs)" := ("Total Minutes") / 60
            else
                if CapacityUOM.Type = CapacityUOM.Type::Minutes then
                    "Time(Hrs)" := "Total Minutes"
                else
                    if CapacityUOM.Type = CapacityUOM.Type::Days then
                        "Time(Hrs)" := ("Total Minutes") / 24 * 60
           */
            case CapacityUOM.Type of
                CapacityUOM.Type::Hours:
                    "Time(Hrs)" := ("Total Minutes") / 60;
                //minutes
                CapacityUOM.Type::Minutes:
                    "Time(Hrs)" := "Total Minutes";
                // days
                CapacityUOM.Type::Days:
                    "Time(Hrs)" := ("Total Minutes") / 24 * 60;
            end;
        end;
    end;

    procedure PostResources(JobCardHeader: Record "PM Job Header B2B");
    begin
        PLMSetupRec.GET();
        ResJournalLine.SETRANGE("Journal Template Name", PLMSetupRec."Resource Template");
        ResJournalLine.SETRANGE("Journal Batch Name", PLMSetupRec."Resource Journal Batch");
        if ResJournalLine.FIND('-') then
            ResJournalLine.DELETEALL();

        RLineNo := 0;
        EntryPosted := false;

        WorkSheet.RESET();
        WorkSheet.SETRANGE("Job Card No.", JobCardHeader."No.");
        WorkSheet.SETRANGE(Resource, true);
        if WorkSheet.FIND('-') then
            repeat
                EntryPosted := false;
                WorkSheet.TESTFIELD("I/R Code");
                WorkSheet.TESTFIELD("Time Required");
                ResJournalLine.INIT();
                ResJournalLine."Journal Template Name" := PLMSetupRec."Resource Template";
                ResJournalLine."Journal Batch Name" := PLMSetupRec."Resource Journal Batch";
                ResJournalLine."Posting Date" := WORKDATE();
                ResJournalLine."Document Date" := WORKDATE();
                ResJournalLine."Document No." := WorkSheet."Job Card No.";
                ResJournalLine."Line No." := RLineNo + 10000;
                ResJournalLine."Entry Type" := ResJournalLine."Entry Type"::Usage;
                ResJournalLine."Machine Id B2B" := WorkSheet."Machine ID";
                ResJournalLine.VALIDATE("Resource No.", WorkSheet."I/R Code");
                ResJournalLine.VALIDATE(Quantity, WorkSheet.Quantity);
                ResJournalLine.VALIDATE("Unit of Measure Code", WorkSheet.UOM);
                ResJournalLine.VALIDATE("Unit Cost", WorkSheet."Unit Cost");
                RLineNo := RLineNo + 10000;
                EntryPosted := true;
                ResJournalLine.INSERT();
                ResJournalLine.VALIDATE("Shortcut Dimension 1 Code", JobCardHeader."Shortcut Dimension 1 Code");
                ResJournalLine.VALIDATE("Shortcut Dimension 2 Code", JobCardHeader."Shortcut Dimension 2 Code");
                ResJournalLine.MODIFY();
                ResJnlPost.RUN(ResJournalLine);
                WorkSheet.Posted := true;
            until WorkSheet.NEXT() = 0;
    end;

    procedure CheckStatus();
    begin
        TESTFIELD(Status, Status::Open);
    end;

    procedure ReleaseStatus();
    var
        MaintType: Record "Maintenance Type B2B";
    begin
        TESTFIELD(Status, Status::Open);
        TESTFIELD("Maintenance Type");

        "Start Date Time" := CURRENTDATETIME();

        MaintType.Get("Maintenance Type");
        IF (MaintType.External) AND (Status = Status::Open) THEN BEGIN
            IF NOT CONFIRM(Text0010Lbl, FALSE) THEN
                EXIT;
            //sTo check the Subcontracting Lines
            RelPLMDoc.ReleaseJobCard(Rec);
            SubconWorkSheet.RESET();
            SubconWorkSheet.SETRANGE("Job Card No.", "No.");
            IF SubconWorkSheet.FINDFIRST() THEN
                ERROR(Text0002Lbl);


            SubconWorkSheet.INIT();
            SubconWorkSheet."Job Card No." := "No.";
            SubconWorkSheet."Service Type" := Type;
            SubconWorkSheet."Machine Id" := "Machine ID";
            SubconWorkSheet."Line No." += 10000;
            //added code for vendor no from Job Card begin
            //B2BV1.0 >>   
            MachineRec.GET("Machine ID");
            // SubconWorkSheet."Vendor No." := MachineRec."Service Vendor";
            // //MESSAGE('%1',SubconWorkSheet."Vendor No.");
            MachineRec.Reset();
            MachineRec.SetRange("No.", "Machine ID");
            MachineRec.SetRange(Warranty, MachineRec.Warranty::Yes);
            MachineRec.SetFilter("Warranty Expiry", '>=%1', "Created Date");
            if MachineRec.FindFirst() then
                SubconWorkSheet."Vendor No." := MachineRec."Warranty Vendor No."
            ELSE begin
                MachineRec.Reset();
                MachineRec.SetRange("No.", "Machine ID");
                MachineRec.SetRange("A.M.C", MachineRec."A.M.C"::Yes);
                MachineRec.SetFilter("A.M.C Start Date", '<=%1', "Created Date");
                MachineRec.SetFilter("A.M.C End  Date", '>=%1', "Created Date");
                if MachineRec.FindFirst() then
                    SubconWorkSheet."Vendor No." := MachineRec."A.M.C Vendor No."
                else
                    SubconWorkSheet."Vendor No." := MachineRec."Service Vendor";
            END;
            //B2BV1.0 <<
            PMJobLineRec.RESET();
            PMJobLineRec.SETRANGE("Job Header No.", "No.");
            PMJobLineRec.SETRANGE("Line No.", 10000);
            IF PMJobLineRec.FINDFIRST() THEN
                SubconWorkSheet.Description := PMJobLineRec.Description;

            SubconWorkSheet."Inspection Type" := "Maintenance Type";
            SubconWorkSheet.Date := WORKDATE();
            SubconWorkSheet.Status := SubconWorkSheet.Status::"  ";
            SubconWorkSheet.INSERT();
            MESSAGE(Text0001Lbl);
        END ELSE
            RelPLMDoc.ReleaseJobCard(Rec);
    end;

    procedure ReopenStatus();
    var
        Text0991Lbl: Label 'One or more worksheets are existing for %1.', Comment = '%1 = No.';
    begin
        WorkSheet.RESET();
        WorkSheet.SETRANGE("Job Card No.", "No.");
        if WorkSheet.FINDFIRST() then
            ERROR(Text0991Lbl, "No.");

        if External = true then begin
            if not CONFIRM(Text0009Lbl, false) then
                exit
            else
                SubconWorkSheet1.SETRANGE("Job Card No.", "No.");
            SubconWorkSheet1.SETRANGE("Machine Id", "Machine ID");
            if SubconWorkSheet1.FINDFIRST() then
                SubconWorkSheet1.DELETE();
        end;


        TESTFIELD(Status, Status::Released);
        RelPLMDoc.ReopenJobCard(Rec);
    end;

    procedure UpdateMaintenanceType();
    begin
        PMJobLineLVar.RESET();
        PMJobLineLVar.SETRANGE(PMJobLineLVar."Job Header No.", "No.");
        PMJobLineLVar.SETRANGE(PMJobLineLVar."Machine ID", "Machine ID");
        if PMJobLineLVar.FINDFIRST() then begin
            if External = true then begin
                PMJobLineLVar."Maintenace Type" := Text0012Lbl;
                PMJobLineLVar."Maintenace Type Name" := "Machine Name";
            end else
                PMJobLineLVar."Maintenace Type" := Text0013Lbl;
            PMJobLineLVar."Maintenace Type Name" := "Machine Name"
        end;
        PMJobLineLVar.MODIFY(true);
    end;

    procedure CheckWorkSheet();
    var
        Text091Lbl: Label 'One or more worksheets are still pending.';
    begin
        WorkSheet.RESET();
        WorkSheet.SETRANGE("Job Card No.", "No.");
        WorkSheet.SETRANGE(Posted, false);
        if WorkSheet.FINDFIRST() then
            ERROR(Text091Lbl);
    end;

    procedure DateTimeValidations();
    begin
        "Time Duration" := ROUND("End Date Time" - "Start Date Time", 1);

        "Total Minutes" := ("End Date Time" - "Start Date Time") / 60000;

        "Time(Hrs)" := ("Total Minutes") / 60;

        IF "Total Minutes" < 0 then
            Error('End Date time can not be less than Start date time');

    end;

    procedure UpdateWorkSheet();
    begin
        WorkSheet.RESET();
        WorkSheet.SETRANGE("Job Card No.", "No.");
        WorkSheet.MODIFYALL("Job Posted", true);
    end;


    var
        PMJobLineLVar: Record "PM Job Line B2B";

}

