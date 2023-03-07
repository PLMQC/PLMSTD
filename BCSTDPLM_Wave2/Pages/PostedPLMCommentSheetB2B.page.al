page 33000982 "Posted PLM Comment Sheet B2B"
{

    AutoSplitKey = true;
    Caption = 'Posted PLM Comment Sheet';
    Editable = false;
    PageType = List;
    SourceTable = "PLM Comment Line B2B";
    UsageCategory = Documents;
    ApplicationArea = all;
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
                    ToolTip = 'It Defines Comments.';
                }
            }
        }
    }

    actions
    {
    }
}

