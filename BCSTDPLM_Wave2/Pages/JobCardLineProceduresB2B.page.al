page 33000926 "Job Card Line Procedures B2B"
{

    AutoSplitKey = false;
    Caption = 'Job Card Line Procedures';
    DelayedInsert = true;
    PageType = Worksheet;
    SourceTable = "Job Card  Line Procedure B2B";
    UsageCategory = Tasks;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            repeater(Control1102154000)
            {
                field("Step No."; Rec."Step No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the Job step no.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the Description.';
                }
                field("Work Center"; Rec."Work Center")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the Work center.';
                }
                field("Special Tools"; Rec."Special Tools")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the Special tools.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the Status.';
                    OptionCaption = '" ,Finished,Not Applicable,Additional"';
                }
                field("Perfomed By"; Rec."Perfomed By")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the Perfomed By.';
                }
            }
        }
    }

    actions
    {
    }
}

