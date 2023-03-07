table 33000916 "Frequency  B2B"
{

    Caption = 'Frequency';
    DrillDownPageID = "Frequency B2B";
    LookupPageID = "Frequency B2B";
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
            DataClassification = CustomerContent;
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(3; "Time Interval"; DateFormula)
        {
            Caption = 'Time Interval';
            DataClassification = CustomerContent;
        }
        field(4; "Run Time"; Boolean)
        {
            Caption = 'Run Time';
            DataClassification = CustomerContent;
        }
        field(5; "Frequency Type"; Option)
        {
            Caption = 'Frequency Type';
            OptionMembers = ," ",RUNTIME,"METER BASED";
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
}

