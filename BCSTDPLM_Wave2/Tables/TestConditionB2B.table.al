table 33000940 "Test Condition B2B"
{

    Caption = 'Test Condition';
    DrillDownPageID = "Test Details B2B";
    LookupPageID = "Test Details B2B";
    DataClassification = CustomerContent;
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if "No." <> xRec."No." then begin
                    MachineSetup.GET();
                    NoSeriesMgt.TestManual(MachineSetup."Machine Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Machine Id"; Code[10])
        {
            Caption = 'Machine Id';
            DataClassification = CustomerContent;
            Editable = true;
            TableRelation = "Equipment B2B";

            trigger OnValidate();
            begin
                Equipment.GET("Machine Id");
                "Machine Name" := Equipment.Name;
            end;
        }
        field(3; "Machine Name"; Text[50])
        {
            Caption = 'Machine Name';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(5; Date; Date)
        {
            Caption = 'Date';
            DataClassification = CustomerContent;
        }
        field(7; Condition; Option)
        {
            Caption = 'Condition';
            DataClassification = CustomerContent;
            OptionCaption = '" ,OK,Not OK"';
            OptionMembers = " ",OK,"Not OK";
        }
        field(9; "Test Description"; Text[30])
        {
            Caption = 'Test Description';
            DataClassification = CustomerContent;
        }
        field(11; Remarks; Text[30])
        {
            Caption = 'Remarks';
            DataClassification = CustomerContent;
        }
        field(12; "Job Card No."; Code[10])
        {
            Caption = 'Job Card No.';
            DataClassification = CustomerContent;
        }
        field(13; Posted; Boolean)
        {
            Caption = 'Posted';
            DataClassification = CustomerContent;
        }
        field(14; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
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
            MachineSetup.GET();
            MachineSetup.TESTFIELD("Test For Predictive No.");
            NoSeriesMgt.InitSeries(MachineSetup."Test For Predictive No.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    var
        Equipment: Record "Equipment B2B";
        TestConditionRec: Record "Test Condition B2B";
        MachineSetup: Record "Plant Maintenance Setup B2B";
        NoSeriesMgt: Codeunit NoSeriesManagement;


    procedure AssistEdit(TestCondition: Record "Test Condition B2B"): Boolean;
    begin
        TestConditionRec := Rec;
        MachineSetup.GET();
        MachineSetup.TESTFIELD("Test For Predictive No.");
        if NoSeriesMgt.SelectSeries(MachineSetup."Test For Predictive No.", TestCondition."No. Series", TestConditionRec."No. Series") then begin
            NoSeriesMgt.SetSeries(TestConditionRec."No.");
            Rec := TestConditionRec;
            exit(true);
        end;
    end;
}

