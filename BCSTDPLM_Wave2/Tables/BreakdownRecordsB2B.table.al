table 33000909 "Breakdown Records B2B"
{

    Caption = 'Breakdown Records';
    LookupPageID = "Breakdown List B2B";

    fields
    {
        field(1; "Complaint No."; Code[20])
        {
            Caption = 'Complaint No.';
            DataClassification = CustomerContent;
            Editable = true;
        }
        field(2; "Complaint Date"; DateTime)
        {
            Caption = 'Complaint Date';
            DataClassification = CustomerContent;
        }
        field(3; "Machine No."; Code[20])
        {
            Caption = 'Machine No.';
            DataClassification = CustomerContent;
            Editable = true;
            TableRelation = "Equipment B2B";

            trigger OnValidate();
            begin
                MachineRec.SETRANGE("No.", "Machine No.");
                if MachineRec.FINDFIRST() then
                    "Machine Name" := MachineRec.Name;
                "Plant ID" := MachineRec."Machine Location";
                System := MachineRec."Equipment Type";
            end;
        }
        field(4; "Machine Name"; Text[50])
        {
            Caption = 'Machine Name';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(8; "Posted By"; Code[50])
        {
            Caption = 'Posted By';
            Editable = false;
            TableRelation = User;
            DataClassification = CustomerContent;
        }
        field(9; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = CustomerContent;
        }
        field(10; "Problem Description"; Text[100])
        {
            Caption = 'Problem Description';
            DataClassification = CustomerContent;
            Editable = true;
        }
        field(11; Posted; Boolean)
        {
            Caption = 'Posted';
            DataClassification = CustomerContent;
        }
        field(12; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = 'Open,Released,Rejected';
            DataClassification = CustomerContent;
            OptionMembers = Open,Released,Rejected;
        }
        field(14; Criticality; Text[30])
        {
            Caption = 'Criticality';
            TableRelation = "Criticality B2B";
            DataClassification = CustomerContent;
        }
        field(15; "Maintenance Type"; Code[20])
        {
            Caption = 'Maintenance Type';
            TableRelation = "Maintenance Type B2B";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if InspectionType.GET("Maintenance Type") then begin
                    "Maintenance Type Name" := InspectionType.Description;
                    External := InspectionType.External;
                end else
                    "Maintenance Type Name" := '';
            end;
        }
        field(16; "Maintenance Type Name"; Text[50])
        {
            Caption = 'Maintenance Type Name';
            DataClassification = CustomerContent;
        }
        field(17; Remarks; Text[100])
        {
            Caption = 'Remarks';
            DataClassification = CustomerContent;
        }
        field(30; "Machine Type"; Option)
        {
            Caption = 'Machine Type';
            OptionCaption = 'Int,Ext';
            OptionMembers = Int,Ext;
            DataClassification = CustomerContent;
        }
        field(34; NoSeries; Code[20])
        {
            Caption = 'NoSeries';
            DataClassification = CustomerContent;
        }
        field(38; "Complaint Release Date"; Date)
        {
            Caption = 'Complaint Release Date';
            DataClassification = CustomerContent;
        }
        field(39; "Complaint Release Time"; Time)
        {
            Caption = 'Complaint Release Time';
            DataClassification = CustomerContent;
        }
        field(40; "Job Card No."; Code[20])
        {
            Caption = 'Job Card No.';
            DataClassification = CustomerContent;
            TableRelation = "PM Job Header B2B";
        }
        field(41; "Job Card Posted"; Boolean)
        {
            Caption = 'Job Card Posted';
            DataClassification = CustomerContent;
        }
        field(45; External; Boolean)
        {
            Caption = 'External';
            DataClassification = CustomerContent;
        }
        field(46; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
        }
        field(50; Comment; Boolean)
        {
            Caption = 'Comment';
            DataClassification = CustomerContent;
        }
        field(51; "Breakdown Status"; Option)
        {
            Caption = 'Breakdown Status';
            DataClassification = CustomerContent;
            OptionCaption = 'Registration,Complaints';
            OptionMembers = Registration,Complaints;
        }
        field(52; "Plant ID"; Code[20])
        {
            Caption = 'Plant ID';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(53; System; Code[20])
        {
            Caption = 'System';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(54; "Job Card Status"; Option)
        {
            Caption = 'Job Card Status';
            DataClassification = CustomerContent;
            Editable = false;
            OptionCaption = '" ,Open,Released"';
            OptionMembers = " ",Open,Released;
        }
        field(56; Originator; Text[50])
        {
            Caption = 'Originator';
            DataClassification = CustomerContent;
        }
        field(57; "Contact Man"; Text[50])
        {
            Caption = 'Contact Man';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Complaint No.")
        {
        }
        key(Key2; "Breakdown Status", "Complaint No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        "Posted By" := FORMAT(USERID());
        "Posting Date" := TODAY();
        "Complaint Date" := CURRENTDATETIME();

        if "Complaint No." = '' then begin
            PLMSetup.GET();
            PLMSetup.TESTFIELD("Complaint Nos.");
            NoSeriesMgt.InitSeries(PLMSetup."Complaint Nos.", xRec."No. Series", 0D, "Complaint No.", "No. Series");
        end;
    end;

    trigger OnRename();
    begin
        "Complaint Date" := CURRENTDATETIME();
    end;

    var
        InspectionType: Record "Maintenance Type B2B";
        BreakDownRecGlobal: Record "Breakdown Records B2B";
        MachineRec: Record "Equipment B2B";
        PLMSetup: Record "Plant Maintenance Setup B2B";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Text001Lbl: Label 'Do you want to convert from Registration to Complaint ?';
        Text002Lbl: Label 'Complaint created successfully as %1', Comment = '%1 = Complaint No.';
        Text003Lbl: Label 'Do you want to reject the Breackdown ?';


    procedure AssistEdit(BreakDownRecLocal: Record "Breakdown Records B2B"): Boolean;
    begin
        BreakDownRecGlobal := Rec;
        PLMSetup.GET();
        PLMSetup.TESTFIELD("Machine Nos.");
        if NoSeriesMgt.SelectSeries(PLMSetup."Complaint Nos.", BreakDownRecLocal.NoSeries, BreakDownRecGlobal.NoSeries) then begin
            NoSeriesMgt.SetSeries(BreakDownRecGlobal."Complaint No.");
            Rec := BreakDownRecGlobal;
            exit(true);
        end;
    end;

    procedure UpdateBreakdownStatus();
    begin
        TESTFIELD("Machine No.");
        TESTFIELD("Problem Description");
        TESTFIELD(Criticality);
        if CONFIRM(Text001Lbl) then begin
            "Breakdown Status" := "Breakdown Status"::Complaints;
            MODIFY();
            MESSAGE(Text002Lbl, "Complaint No.");
        end;
    end;

    procedure RejectBreakdown();
    begin
        if not CONFIRM(Text003Lbl) then
            ERROR('');
        VALIDATE(Status, Status::Released);
        MODIFY(true);
    end;
}

