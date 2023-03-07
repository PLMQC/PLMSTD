table 33000924 "Calibration PLM B2B"
{

    Caption = 'Calibration';
    LookupPageID = "Calibration PLM B2B";
    DataClassification = CustomerContent;
    ObsoleteState = Pending;
    ObsoleteReason = 'Functionallity Removed';
    ObsoleteTag = '21.0';
    fields
    {
        field(1; "Code"; Option)
        {
            Caption = 'Code';
            NotBlank = true;
            OptionMembers = " ",PMR,BD,Callib;
            DataClassification = CustomerContent;
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(3; "G/L Account No."; Code[10])
        {
            Caption = 'G/L Account No.';
            TableRelation = "G/L Account"."No.";
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

