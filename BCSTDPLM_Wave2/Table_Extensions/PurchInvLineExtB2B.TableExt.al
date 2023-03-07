tableextension 33000900 "Purch Inv Line Ext B2B" extends "Purch. Inv. Line"
{

    fields
    {
        field(33000890; "Machine Id B2B"; Code[20])
        {
            Caption = 'Machine Id';
            DataClassification = CustomerContent;
        }
        field(33000891; "Job Card No. B2B"; Code[20])
        {
            Caption = 'Job Card No.';
            DataClassification = CustomerContent;
        }
        field(33000892; "Reference No. B2B"; Integer)
        {
            Caption = 'Reference No.';
            DataClassification = CustomerContent;
        }
        field(33000893; "Resource B2B"; Boolean)
        {
            Caption = 'Resource';
            DataClassification = CustomerContent;
        }
        field(33000894; "Spares & Consumables B2B"; Boolean)
        {
            Caption = 'Spares & Consumables';
            DataClassification = CustomerContent;
        }
    }

}

