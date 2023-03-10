table 33000927 "Maint.┬áSchedule┬áTemplate B2B"
{


    Caption = 'Maintainance Schedule Template';
    LookupPageID = "Maint.┬áScheduleTemplate B2B";
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

