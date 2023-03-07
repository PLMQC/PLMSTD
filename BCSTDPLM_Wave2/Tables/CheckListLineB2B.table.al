table 33000933 "Check List Line B2B"
{

    Caption = 'Check List Line';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = CustomerContent;
        }
        field(2; "Code"; Code[20])
        {
            Caption = 'Code';
            TableRelation = "Check List Parameters B2B".Code;
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                PLMCheckListGRec.GET(Code);
                Description := PLMCheckListGRec.Description;
                Frequency := PLMCheckListGRec.Interval;
                "Time Interval" := PLMCheckListGRec."Time Interval";
            end;
        }
        field(3; Description; Text[250])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(4; Frequency; Code[20])
        {
            Caption = 'Frequency';
            TableRelation = "Frequency  B2B".Code;
            DataClassification = CustomerContent;
        }
        field(5; "Time Interval"; DateFormula)
        {
            Caption = 'Time Interval';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Code")
        {
        }
    }

    fieldgroups
    {
    }

    var
        PLMCheckListGRec: Record "Check List Parameters B2B";

}

