pageextension 33000899 "Source Code Setup Ext B2B" extends "Source Code Setup"
{

    layout
    {
        addafter("Compress Cust. Ledger")
        {
            field(EquipmentB2B; Rec."Equipment B2B")
            {
                ApplicationArea = All;
                ToolTip = 'It Specifies the Source code';
            }
        }
    }

    //Unsupported feature: InsertAfter on "Documentation". Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

