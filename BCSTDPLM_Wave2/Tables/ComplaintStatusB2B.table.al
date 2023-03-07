table 33000920 "Complaint Status B2B"
{

    Caption = 'Complaint Status';
    LookupPageID = "Complaint Status B2B";
    DataClassification = ToBeClassified;
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

