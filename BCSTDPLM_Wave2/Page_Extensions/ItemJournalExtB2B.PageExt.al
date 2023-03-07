pageextension 33000891 "Item Journal Ext B2B" extends "Item Journal"
{
    layout
    {
        addafter(Description)
        {

            field("Serial No. B2B"; Rec."Serial No.")
            {
                ApplicationArea = All;
                ToolTip = 'Serial Numbers Are Used for Tracking Purpose, These can be Assigned From The Item Tracking Specifications Page. Serial Numbers Are Assigned Against the Single Item';
            }
        }
        addafter("Shortcut Dimension 2 Code")
        {
            field("Lot No. B2B"; Rec."Lot No.")
            {
                ApplicationArea = All;
                ToolTip = 'Lot Numbers Are Used for Tracking Purpose, These can be Assigned From The Item Tracking Specifications Page. Lot Numbers Are Assigned Against The Group of Items';
            }
        }
    }

}

