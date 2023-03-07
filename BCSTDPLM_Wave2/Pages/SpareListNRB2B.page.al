page 33000904 "Spare List NR B2B"
{

    Caption = 'Spare List NR';
    Editable = false;
    PageType = List;
    SourceTable = "Spare B2B";
    UsageCategory = Lists;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                field("Machine ID"; Rec."Machine ID")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Machine/Equipment ID.';
                }
                field("Machine Name"; Rec."Machine Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'Based on selected Machine ID, Machine Name will Appear.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Description of the Machine.';
                }
                field("Nos."; Rec."Nos.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Spare list No.';
                }
                field("Component ID"; Rec."Component ID")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Component ID.';
                }
                field("Component Name"; Rec."Component Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Component Name.';
                }
                field("Item Name"; Rec."Item Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Item name.';
                }
            }
        }
    }

    actions
    {
    }
}

