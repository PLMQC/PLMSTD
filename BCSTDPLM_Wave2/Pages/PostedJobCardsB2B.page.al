page 33000930 "Posted Job Cards B2B"
{

    Caption = 'Posted Job Cards';
    CardPageID = "Posted PM Job Card B2B";
    Editable = false;
    PageType = List;
    SourceTable = "PM Job Header B2B";
    SourceTableView = WHERE(Posted = CONST(true));
    UsageCategory = History;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            repeater(Control1102154000)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows No ';
                }
                field("Machine ID"; Rec."Machine ID")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows Machine ID.';
                }
                field("Machine Name"; Rec."Machine Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows Machine Name.';
                }
                field(Type; Rec.Type)
                {
                    OptionCaption = 'PMR,BreakDown,Others,Predictive';
                    ApplicationArea = all;
                    ToolTip = 'It Shows Type.';
                }
                field("Failure Code"; Rec."Failure Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows Failure Code.';
                }
                field("Frequency Name"; Rec."Frequency Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows Frequency Name.';
                }
                field("Start Date Time"; Rec."Start Date Time")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows Start date and Time.';
                }
                field("Total Cost"; Rec."Total Cost")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows total cost.';
                }
            }
        }
    }

    actions
    {
    }
}

