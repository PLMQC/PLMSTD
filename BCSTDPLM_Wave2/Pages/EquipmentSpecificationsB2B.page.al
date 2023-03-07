page 33000902 "Equipment Specifications B2B"
{

    Caption = 'Equipment Specifications';
    PageType = ListPart;
    SourceTable = "Specification B2B";

    layout
    {
        area(content)
        {
            repeater(Control1102154000)
            {
                field("Spec. Group ID"; Rec."Spec. Group ID")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Spec Grop ID. And Is Unique.';
                }
                field("Specification Group Name"; Rec."Specification Group Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Specification Group name.';
                }
                field("Spec. ID"; Rec."Spec. ID")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Specification ID.';
                }
                field(UOM; Rec.UOM)
                {
                    Enabled = false;
                    ApplicationArea = all;
                    ToolTip = 'It Shows UOM.';
                }
                field("Specification Name"; Rec."Specification Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Specification Name.';
                }
                field(Value; Rec.Value)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Value.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Description.';
                }
            }
        }
    }

    actions
    {
    }
}

