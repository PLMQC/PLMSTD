tableextension 33000895 "Gen Journal Line Ext B2B" extends "Gen. Journal Line"
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
        field(33000892; "Post Dated Cheque B2B"; Boolean)
        {
            Caption = 'Post Dated Cheque';
            DataClassification = CustomerContent;
        }
    }

}

