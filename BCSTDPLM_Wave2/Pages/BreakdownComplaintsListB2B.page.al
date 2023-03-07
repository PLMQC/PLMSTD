page 33000984 "Breakdown Complaints List B2B"
{

    Caption = 'Breakdown Complaints List';
    CardPageID = "Breakdown Complaints B2B";
    DataCaptionFields = "Breakdown Status";
    Editable = false;
    PageType = List;
    SourceTable = "Breakdown Records B2B";
    UsageCategory = Lists;
    ApplicationArea = all;
    SourceTableView = SORTING("Complaint No.")
                      ORDER(Ascending)
                      WHERE(Posted = FILTER(false),
                            "Breakdown Status" = CONST(Complaints));


    layout
    {
        area(content)
        {
            repeater(Control1102154000)
            {
                field("Complaint No."; Rec."Complaint No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Complaints no.';

                }
                field("Complaint Date"; Rec."Complaint Date")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Complaint date.';
                }
                field("Machine No."; Rec."Machine No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Machine NO.';
                }
                field("Machine Name"; Rec."Machine Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Machine name.';
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Posted By.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Posting Date.';
                }
                field("Problem Description"; Rec."Problem Description")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Problem Description .';
                }
                field(Status; Rec.Status)
                {
                    OptionCaption = 'Open,Released,Rejected';
                    ApplicationArea = all;
                    ToolTip = 'It Defines Status.';
                }
                field("Breakdown Status"; Rec."Breakdown Status")
                {
                    OptionCaption = 'Registration,Complaints';
                    ApplicationArea = all;
                    ToolTip = 'It Defines Breakdown status.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines posted or not.';
                }
                field(Criticality; Rec.Criticality)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Criticality.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Remarks.';
                }
            }
        }
    }

    actions
    {
    }
}

