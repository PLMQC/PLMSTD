pageextension 33000895 "Purch Invoice Subform Ext B2B" extends "Purch. Invoice Subform"
{

    layout
    {
        addafter("Variant Code")
        {
            field("Gen. Bus. Posting GroupB2B"; Rec."Gen. Bus. Posting Group")

            {
                ApplicationArea = All;
                ToolTip = 'Gen. Bus. Posting Groups are added to Customers, Vendors, Items and Resources to link item and/or resource transactions from purchases and sales documents as well as item journals and job journals to the G/L';
            }
        }
    }

    //Unsupported feature: InsertAfter on "Documentation". Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

