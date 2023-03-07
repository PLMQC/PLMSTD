tableextension 33000892 "Item Ledger Entry Ext B2B" extends "Item Ledger Entry"
{

    fields
    {
        field(33000890; "Machine Id B2B"; Code[20])
        {
            Caption = 'Machine Id';
            DataClassification = CustomerContent;
        }
        field(33000891; "QLE No. B2B"; Integer)
        {
            Caption = 'QLE No.';
            DataClassification = CustomerContent;
            ObsoleteState = Removed;
            ObsoleteReason = 'Functionallity Removed';
            ObsoleteTag = '21.0';
        }

    }
}
