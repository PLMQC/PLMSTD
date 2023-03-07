pageextension 33000898 "General Ledger Setup Ext B2B" extends "General Ledger Setup"
{

    layout
    {
        addafter("Payroll Transaction Import")
        {
            group(AttachmentsB2B)
            {
                Caption = 'Attachments';
                field("Attachment St. LocationB2B"; Rec."Attachment St. Location B2B")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines the Attachment St. Location.';
                }
            }
        }
    }

    //Unsupported feature: InsertAfter on "Documentation". Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

