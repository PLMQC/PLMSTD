page 33000937 "Equipment Groups B2B"
{
    Caption = 'Equipment Groups';
    PageType = List;
    SourceTable = "Equipment Group B2B";
    UsageCategory = Administration;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            repeater(Control1102154000)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Group code.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Group Description.';
                }
            }
        }
    }

    actions
    {
    }
}

