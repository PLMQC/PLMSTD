page 33000957 "Breakdown Job List B2B"
{

    Caption = 'Breakdown Job List';
    CardPageID = "Breakdown Job Card B2B";
    Editable = false;
    PageType = List;
    SourceTable = "PM Job Header B2B";
    SourceTableView = SORTING("No.", "Machine ID")
                      ORDER(Ascending)
                      WHERE(Posted = CONST(false),
                            Type = CONST(BreakDown));
    UsageCategory = Tasks;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Control1102154000)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines No.';
                }
                field(Status; Rec.Status)
                {
                    OptionCaption = 'Open,Released';
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Status.';
                }
                field("Machine ID"; Rec."Machine ID")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Machine ID.';
                }
                field("Machine Name"; Rec."Machine Name")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Machine Name.';
                }
                field(Type; Rec.Type)
                {
                    OptionCaption = 'PMR,BreakDown,Others,Predictive';
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Type Of Breakdown.';
                }
                field("Frequency Name"; Rec."Frequency Name")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Frequency.';
                }
                field("Start Date Time"; Rec."Start Date Time")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Start date and time.';
                }
                field("Total Cost"; Rec."Total Cost")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines total cost.';
                }
            }
        }
    }

    actions
    {
    }
}

