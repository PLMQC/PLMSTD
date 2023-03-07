tableextension 33000890 "GL Entry Ext B2B" extends "G/L Entry"
{

    fields
    {
        field(33000890; "Machine Id B2B"; Code[20])
        {
            Caption = 'Machine Id';
            DataClassification = CustomerContent;
        }
        field(33000891; "Job Card No_ B2B"; Code[20])
        {
            Caption = 'Job Card No.';
            DataClassification = CustomerContent;
        }
    }

}

