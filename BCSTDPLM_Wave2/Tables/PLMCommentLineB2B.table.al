table 33000930 "PLM Comment Line B2B"
{

    Caption = 'PLM Comment Line';
    LookupPageID = "PLM Comment Sheet B2B";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(3; Date; Date)
        {
            Caption = 'Date';
            DataClassification = CustomerContent;
        }
        field(4; "Code"; Code[10])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
        field(5; Comment; Text[80])
        {
            Caption = 'Comment';
            DataClassification = CustomerContent;
        }
        field(6; "Document Line No."; Integer)
        {
            Caption = 'Document Line No.';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "No.", "Document Line No.", "Line No.")
        {
        }
    }

    fieldgroups
    {
    }
}

