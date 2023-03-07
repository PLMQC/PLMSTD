tableextension 33000898 "General Ledger Setup Ext B2B" extends "General Ledger Setup"
{
    fields
    {
        field(33000890; "Hire Purchase Interest A/c B2B"; Code[20])
        {
            Caption = 'Hire Purchase Interest A/c';
            TableRelation = "G/L Account";
            DataClassification = CustomerContent;
        }
        field(33000891; "Attachment St. Location B2B"; Code[100])
        {
            Caption = 'Attachment St. Location';
            DataClassification = CustomerContent;
        }
    }

}

