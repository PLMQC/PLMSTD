pageextension 33000894 "Purchase Order Subform Ext B2B" extends "Purchase Order Subform"
{

    layout
    {
        addafter("No.")
        {
            field("Job Card No.B2B"; Rec."Job Card No. B2B")
            {
                Editable = false;
                ApplicationArea = All;
                ToolTip = 'Job Card Number is Unique Number Assigned Against the Maintenece job Card. These Maintenance Job Cards are used Against the Equipments in Different types of Maintenances.';
            }
            field("Machine Id B2B"; Rec."Machine Id B2B")
            {
                Editable = false;
                ApplicationArea = All;
                ToolTip = 'Machine ID is an Unique ID, Specified Against The Machine/Equipment.';
            }
            field("VAT Bus. Posting Group B2B"; Rec."VAT Bus. Posting Group")
            {
                ApplicationArea = All;
                ToolTip = 'VAT Bus. Posting Groups are Used to Calculate the VAT, Specific to Business.';
            }
        }
        addafter("IC Partner Ref. Type")
        {
            field("Gen. Bus. Posting Group B2B"; Rec."Gen. Bus. Posting Group")
            {
                ApplicationArea = All;
                ToolTip = 'Assign this group to customers and vendors to specify who you sell to, and who you buy from. Set these up in the Gen. Business Posting Groups window.';
            }
            field("Gen. Prod. Posting Group B2B"; Rec."Gen. Prod. Posting Group")
            {
                ApplicationArea = All;
                ToolTip = 'Assign this group to items and resources to specify what you sell, and what you buy. Set these up in the Gen. Product Posting Groups window.';
            }
        }
        addafter("IC Partner Reference")
        {
            field("Dimension Set ID B2B"; Rec."Dimension Set ID")
            {
                ApplicationArea = All;
                ToolTip = 'Dimension set ID that is assigned to each dimension set entry that belongs to the dimension set. A dimension set is a unique combination of dimension values.';
            }
        }
    }
}