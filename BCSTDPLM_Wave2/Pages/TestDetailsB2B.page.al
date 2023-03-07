page 33000975 "Test Details B2B"
{


    Caption = 'Test Details';
    CardPageID = "Test Condition Card B2B";
    Editable = false;
    PageType = List;
    SourceTable = "Test Condition B2B";
    UsageCategory = Lists;
    ApplicationArea = all;
    layout
    {
        area(content)
        {
            repeater(Control1102154000)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines No.';
                }
                field("Machine Id"; Rec."Machine Id")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines Machine ID.';
                }
                field("Machine Name"; Rec."Machine Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines Machine Name.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines Date.';
                }
                field(Condition; Rec.Condition)
                {
                    OptionCaption = '" ,OK,Not OK"';
                    ApplicationArea = All;
                    ToolTip = 'It Defines Condition.';
                }
                field("Test Description"; Rec."Test Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines Description.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines Remarks.';
                }
                field("Job Card No."; Rec."Job Card No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines Job card Number.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines Posted or not.';
                }
            }
        }
    }

    actions
    {
    }
}

