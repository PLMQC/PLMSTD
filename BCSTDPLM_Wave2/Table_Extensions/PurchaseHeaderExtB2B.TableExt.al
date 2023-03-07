tableextension 33000893 "Purchase Header Ext B2B" extends "Purchase Header"
{
    fields
    {

        field(33000890; "Job Card No. B2B"; Code[20])
        {
            Caption = 'Job Card No.';
            DataClassification = CustomerContent;
        }
        field(33000891; "Machine Id B2B"; Code[20])
        {
            Caption = 'Machine Id';
            DataClassification = CustomerContent;
        }
    }
}

