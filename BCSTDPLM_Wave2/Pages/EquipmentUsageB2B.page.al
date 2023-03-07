page 33000947 "Equipment Usage B2B"
{

    Caption = 'Equipment Usage';
    PageType = List;
    SourceTable = "Equipment Usage B2B";
    UsageCategory = Documents;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Control1102154000)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Code.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Description.';
                }
            }
        }
    }

    actions
    {
    }
}

