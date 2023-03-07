page 33000968 "Rej./Close Breakdown List B2B"
{

    Caption = 'Rejected/Close Breakdown List';
    CardPageID = "Breakdown Complaints B2B";
    Editable = false;
    PageType = List;
    SourceTable = "Breakdown Records B2B";
    ApplicationArea = All;
    SourceTableView = SORTING("Breakdown Status", "Complaint No.")
                      ORDER(Ascending)
                      WHERE(Posted = FILTER(true));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'Group';
                field("Complaint No."; Rec."Complaint No.")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Complaints No.';
                }
                field("Complaint Date"; Rec."Complaint Date")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines date.';
                }
                field("Machine No."; Rec."Machine No.")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Machine no.';
                }
                field("Machine Name"; Rec."Machine Name")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Machine Name.';
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Posted By.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines posting Date.';
                }
                field("Problem Description"; Rec."Problem Description")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Problem.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Posted or not.';
                }
                field(Status; Rec.Status)
                {
                    OptionCaption = 'Open,Released,Rejected';
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Status.';
                }
                field(Criticality; Rec.Criticality)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Criticality.';
                }
                field("Maintenance Type"; Rec."Maintenance Type")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Maintenance type.';
                }
                field("Maintenance Type Name"; Rec."Maintenance Type Name")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Maintenance type name.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Remarks.';
                }
                field("Machine Type"; Rec."Machine Type")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Machine Type.';
                    OptionCaption = 'Int,Ext';
                }
                field(NoSeries; Rec.NoSeries)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines No series.';
                }
                field("Complaint Release Date"; Rec."Complaint Release Date")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Complaint release date.';
                }
                field("Complaint Release Time"; Rec."Complaint Release Time")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Complaint release time.';
                }
                field("Job Card No."; Rec."Job Card No.")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Job card no.';
                }
                field("Job Card Posted"; Rec."Job Card Posted")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Job card posted or not.';
                }
                field(External; Rec.External)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines external type.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines No series.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Comments.';
                }
                field("Breakdown Status"; Rec."Breakdown Status")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Breakdown status.';
                    OptionCaption = 'Registration,Complaints';
                }
                field("Plant ID"; Rec."Plant ID")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines plant ID/Location.';
                }
                field(System; Rec.System)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines System.';
                }
                field("Job Card Status"; Rec."Job Card Status")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Job card Status.';
                    OptionCaption = '" ,Open,Released"';
                }
                field(Originator; Rec.Originator)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Originator.';
                }
                field("Contact Man"; Rec."Contact Man")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Contact person.';
                }
            }
        }
    }

    actions
    {
    }
}

