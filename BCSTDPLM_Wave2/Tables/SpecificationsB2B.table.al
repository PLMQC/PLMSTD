table 33000914 "Specifications B2B"
{

    Caption = 'Specifications';
    LookupPageID = "Specifications PLM B2B";

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
        field(3; "Base Unit Of Messure"; Code[10])
        {
            Caption = 'Base Unit Of Messure';
            TableRelation = "Unit of Measure";
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
        fieldgroup(DrillDown; "Code", Description)
        {
        }
    }
}

