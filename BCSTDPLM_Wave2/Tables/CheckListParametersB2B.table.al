table 33000910 "Check List Parameters B2B"
{

    Caption = 'Check List Parameters';
    DrillDownPageID = "Check List Parameters B2B";
    LookupPageID = "Check List Parameters B2B";
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
        field(2; Description; Text[250])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(3; Interval; Code[20])
        {
            Caption = 'Interval';
            TableRelation = "Frequency  B2B".Code;
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                FrequencyGRec.SETRANGE(Code, Interval);
                if FrequencyGRec.FINDFIRST() then begin
                    ;
                    "Time Interval" := FrequencyGRec."Time Interval";
                end;
            end;
        }
        field(4; "Time Interval"; DateFormula)
        {
            Caption = 'Time Interval';
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

    var
        FrequencyGRec: Record "Frequency  B2B";
}

