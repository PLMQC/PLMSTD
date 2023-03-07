tableextension 33000899 "Purch Rcpt Line Ext B2B" extends "Purch. Rcpt. Line"
{
    fields
    {
        field(33000890; "Machine Id. B2B"; Code[20])
        {
            Caption = 'Machine Id.';
            DataClassification = CustomerContent;
        }
        field(33000891; "Job Card No. B2B"; Code[20])
        {
            Caption = 'Job Card No.';
            DataClassification = CustomerContent;
        }
    }
}