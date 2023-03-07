page 33000985 "Others Job List B2B"
{

    Caption = 'Others Job List';
    CardPageID = "Other Job Card B2B";
    Editable = false;
    PageType = List;
    SourceTable = "PM Job Header B2B";
    SourceTableView = SORTING("No.", "Machine ID")
                      ORDER(Ascending)
                      WHERE(Posted = FILTER(false),
                            Type = FILTER(Others | Predictive));
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
                    ToolTip = 'It Defines machine ID.';
                }
                field("Machine Name"; Rec."Machine Name")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Machine name.';
                }
                field(Type; Rec.Type)
                {
                    OptionCaption = 'PMR,BreakDown,Others,Predictive';
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Type.';
                }
                field("Frequency Name"; Rec."Frequency Name")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Frequency.';
                }
                field("Start Date Time"; Rec."Start Date Time")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines start date and time .';
                }
            }
        }
    }

    actions
    {
    }
}

