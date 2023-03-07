page 33000979 "Run Time Frequency List B2B"
{

    Caption = 'Run Time Frequency List';
    CardPageID = "Run Time Frequency Card B2B";
    Editable = false;
    PageType = List;
    SourceTable = "Runtime Frequency Header B2B";
    UsageCategory = Lists;
    ApplicationArea = all;
    layout
    {
        area(content)
        {
            repeater(Control1102154000)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines code.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Description.';
                }
                field(Status; Rec.Status)
                {
                    OptionCaption = 'New,Under Development,Certified';
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Status.';
                }
            }
        }
    }

    actions
    {
    }
}

