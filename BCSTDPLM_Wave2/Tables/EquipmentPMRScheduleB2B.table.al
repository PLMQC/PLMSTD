table 33000901 "Equipment PMR Schedule B2B"
{

    Caption = 'Equipment PMR Schedule';
    LookupPageID = "Equi. PMR Schedule List B2B";

    fields
    {
        field(1; "Machine ID"; Code[20])
        {
            Caption = 'Machine ID';
            TableRelation = "Equipment B2B";
            DataClassification = CustomerContent;
        }
        field(2; Frequency; Code[20])
        {
            Caption = 'Frequency';
            TableRelation = "Frequency  B2B";
            DataClassification = CustomerContent;
        }
        field(3; "Maintainance Schedule Part ID"; Code[20])
        {
            Caption = 'Maintainance Schedule Part ID';
            TableRelation = "Maintenance Schedule Part B2B";
            DataClassification = CustomerContent;
        }
        field(10; Date; Date)
        {
            Caption = 'Date';
            DataClassification = CustomerContent;
        }
        field(11; "Equipment Location"; Code[20])
        {
            Caption = 'Equipment Location';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Machine ID", "Maintainance Schedule Part ID", Date)
        {
        }
        key(Key2; "Machine ID", Frequency, Date)
        {
        }
    }

    fieldgroups
    {
    }
}

