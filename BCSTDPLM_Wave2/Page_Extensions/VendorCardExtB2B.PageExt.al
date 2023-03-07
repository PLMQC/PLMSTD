pageextension 33000890 "Vendor Card Ext B2B" extends "Vendor Card"
{
    layout
    {
        addafter("Disable Search by Name")
        {
            field("G/L Account No.B2B"; Rec."G/L Account No. B2B")
            {
                ApplicationArea = All;
                ToolTip = 'GL Account Number is an Unique Number, Defines Against The General ledger Account Card For Each Account. These Accounts can be accesed from Chart of Accounts liSst';
            }
        }

    }
}