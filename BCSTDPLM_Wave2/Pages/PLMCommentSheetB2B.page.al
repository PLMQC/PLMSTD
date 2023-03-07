page 33000955 "PLM Comment Sheet B2B"
{

    AutoSplitKey = true;
    Caption = 'PLM Comment Sheet';
    PageType = List;
    SourceTable = "PLM Comment Line B2B";
    UsageCategory = Documents;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Control1102154000)
            {
                field(Date; Rec.Date)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Date.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Comment.';
                }
            }
        }
    }

    actions
    {
    }
}

