page 33000923 "Posted Equipment Log B2B"
{

    Caption = 'Posted Equipment Log';
    Editable = false;
    PageType = List;
    SourceTable = "Equipment Log B2B";
    UsageCategory = lists;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            repeater(Control1102154000)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Entry no for Log.';

                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Document No.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Posting date.';
                }
                field("Journal Template Name"; Rec."Journal Template Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Journal Template Name.';
                }
                field("Journal Batch Name"; Rec."Journal Batch Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Journal batch name.';
                }
                field("Machine No."; Rec."Machine No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Machine No.';
                }
                field("P/B Type"; Rec."P/B Type")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Maintenance type.';
                    OptionCaption = '"PMR,BreakDown, "';
                }
                field("Start Time"; Rec."Start Time")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Start time.';
                }
                field(Meters; Rec.Meters)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Meters.';
                }
                field("End Time"; Rec."End Time")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the end time.';
                }
                field("Time Duration"; Rec."Time Duration")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Time Duration.';
                }
                field("Total Minutes"; Rec."Total Minutes")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Total Minutes.';
                }
                field("Time(Hrs)"; Rec."Time(Hrs)")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Time in hours.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the type.';
                    OptionCaption = '" ,Run Time,Stop Time,Meters"';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Document Date.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Remarks.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the User ID.';
                }
            }
        }
    }

    actions
    {
    }
}

