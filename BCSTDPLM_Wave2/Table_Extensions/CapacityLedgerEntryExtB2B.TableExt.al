tableextension 33000907 "Capacity Ledger Entry Ext B2B" extends "Capacity Ledger Entry"
{

    fields
    {
        field(33000890; "Machine Id B2B"; Code[20])
        {
            Caption = 'Machine Id';
            TableRelation = "Equipment B2B"."No.";
            DataClassification = CustomerContent;
        }
        field(33000891; "After Inspection B2B"; Boolean)
        {
            Caption = 'After Inspection';
            DataClassification = CustomerContent;
            ObsoleteState = Removed;
            ObsoleteReason = 'Functionallity Removed';
            ObsoleteTag = '21.0';
        }

    }
    keys
    {
        /*key(Key1; "Work Center No.", Type, "Machine Id")
        {
            SumIndexFields = "Run Time";
        }*/
    }

    //Unsupported feature: InsertAfter on "Documentation". Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

