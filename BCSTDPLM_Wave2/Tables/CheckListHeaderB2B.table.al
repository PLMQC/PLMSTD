table 33000932 "Check List Header B2B"
{


    Caption = 'Check List Header';
    DrillDownPageID = "Check List B2B";
    LookupPageID = "Check List B2B";
    DataClassification = CustomerContent;
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(3; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
        }
        field(4; "Created Date"; Date)
        {
            Caption = 'Created Date';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        if "No." = '' then begin
            PLMSetupGRec.Get();
            PLMSetupGRec.TESTFIELD(PLMSetupGRec."Check List Nos.");
            NoSeriesMgt.InitSeries(PLMSetupGRec."Check List Nos.", xRec."No. Series", "Created Date", "No.", "No. Series");
        end;

        "Created Date" := WorkDate();
    end;

    var
        PLMSetupGRec: Record "Plant Maintenance Setup B2B";
        CheckListHead: Record "Check List Header B2B";
        NoSeriesMgt: Codeunit NoSeriesManagement;


    procedure AssistEdit(OldCheckListHead: Record "Check List Header B2B"): Boolean;
    begin
        CheckListHead.COPY(Rec);
        PLMSetupGRec.GET();
        PLMSetupGRec.TESTFIELD("Check List Nos.");
        if NoSeriesMgt.SelectSeries(PLMSetupGRec."Check List Nos.", OldCheckListHead."No. Series", CheckListHead."No. Series") then begin
            NoSeriesMgt.SetSeries(CheckListHead."No.");
            Rec := CheckListHead;
            exit(true);
        end;
    end;
}

