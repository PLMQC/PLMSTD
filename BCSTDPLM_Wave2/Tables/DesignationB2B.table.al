table 33000935 "Designation B2B"
{

    DrillDownPageID = "Designation B2B";
    LookupPageID = "Designation B2B";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;

        }
        field(2; Name; Text[30])
        {
            Caption = 'Name';
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
}

