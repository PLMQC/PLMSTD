table 33000942 "Runtime Frequency Header B2B"
{

    Caption = 'Runtime Frequency Header';
    DrillDownPageID = "Run Time Frequency List B2B";
    LookupPageID = "Run Time Frequency List B2B";
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if Code <> xRec.Code then begin
                    MachineSetup.GET();
                    NoSeriesMgt.TestManual(MachineSetup."Run Time Freqency No.");
                    "No. Series" := '';
                end;

                if Status = Status::Certified then
                    FIELDERROR(Status);
            end;
        }
        field(5; Description; Text[50])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if Status = Status::Certified then
                    FIELDERROR(Status);
            end;
        }
        field(6; Status; Option)
        {
            Caption = 'Status';
            Editable = false;
            OptionCaption = 'New,Under Development,Certified';
            OptionMembers = New,"Under Development",Certified;
            DataClassification = CustomerContent;
        }
        field(9; "Start Date"; Date)
        {
            Caption = 'Start Date';
            DataClassification = CustomerContent;
        }
        field(10; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(20; "Job Card Options"; Option)
        {
            Caption = 'Job Card Options';
            OptionCaption = 'Run Time Based,Period And Runtime Based';
            DataClassification = CustomerContent;
            OptionMembers = "Run Time Based","Period And Runtime Based";
        }
        field(21; "Unit Of Measure Code"; Code[20])
        {
            Caption = 'Unit Of Measure Code';
            TableRelation = "Unit of Measure".Code;
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        RuntimeFrequencyLines.RESET();
        RuntimeFrequencyLines.SETRANGE("Frequency Code", Code);
        RuntimeFrequencyLines.DELETEALL();
    end;

    trigger OnInsert();
    begin
        if Code = '' then begin
            MachineSetup.GET();
            MachineSetup.TESTFIELD("Run Time Freqency No.");
            NoSeriesMgt.InitSeries(MachineSetup."Run Time Freqency No.", xRec."No. Series", 0D, Code, "No. Series");
        end;
    end;

    var
        RunTimeFreqRec: Record "Runtime Frequency Header B2B";
        RuntimeFrequencyLines: Record "Runtime Frequency Line B2B";
        MachineSetup: Record "Plant Maintenance Setup B2B";
        NoSeriesMgt: Codeunit NoSeriesManagement;


    procedure UnderDevelopment();
    begin
        VALIDATE(Status, Status::"Under Development");
        MODIFY(true);
    end;

    procedure Certified();
    begin
        VALIDATE(Status, Status::Certified);
        MODIFY(true);
    end;

    procedure AssistEdit(RunTimeFreqHead: Record "Runtime Frequency Header B2B"): Boolean;
    begin
        RunTimeFreqRec := Rec;
        MachineSetup.GET();
        MachineSetup.TESTFIELD("Run Time Freqency No.");
        if NoSeriesMgt.SelectSeries(MachineSetup."Run Time Freqency No.", RunTimeFreqHead."No. Series", RunTimeFreqRec."No. Series") then begin
            NoSeriesMgt.SetSeries(RunTimeFreqRec.Code);
            Rec := RunTimeFreqRec;
            exit(true);
        end;
    end;
}

