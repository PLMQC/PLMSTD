page 33000903 "Equipment Spares B2B"
{

    SourceTable = "Spare B2B";
    UsageCategory = Lists;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            repeater(Control1102154000)
            {
                field("Item ID"; Rec."Item ID")
                {
                    Caption = 'Component ID';
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Spare ID.';
                }
                field("Item Name"; Rec."Item Name")
                {
                    Caption = 'Component Name';
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Spare Name.';
                }
                field("Part No."; Rec."Part No.")
                {
                    Visible = false;
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Part No.';
                }
                field(Specifications; Rec.Specifications)
                {
                    Visible = false;
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Specifications.';
                }
                field("Availablity Lead Time"; Rec."Availablity Lead Time")
                {
                    Visible = false;
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Availability Lead Time.';
                }
                field(Inventory; Rec.Inventory)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows the Inventory.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Related UOM.';
                }
            }
        }
    }

    actions
    {
    }
}

