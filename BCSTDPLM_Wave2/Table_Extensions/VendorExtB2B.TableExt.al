tableextension 33000891 "Vendor Ext B2B" extends Vendor
{

    fields
    {
        field(33000890; "G/L Account No. B2B"; Code[20])
        {
            Caption = 'G/L Account No.';
            TableRelation = "G/L Account"."No.";
            DataClassification = CustomerContent;
        }
        field(33000891; "Rework Location B2B"; Code[10])
        {
            Caption = 'Rework Location';
            TableRelation = Location;
            DataClassification = CustomerContent;
            ObsoleteState = Removed;
            ObsoleteReason = 'Functionallity Removed';
            ObsoleteTag = '21.0';
        }

    }
}
