page 33000924 "Breakdown List B2B"
{

    Caption = 'Breakdown List';
    CardPageID = "Breakdown Registration B2B";
    Editable = false;
    PageType = List;
    SourceTable = "Breakdown Records B2B";
    SourceTableView = SORTING("Breakdown Status", "Complaint No.")
                      WHERE("Breakdown Status" = CONST(Registration),
                            Posted = FILTER(false));
    UsageCategory = Lists;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Complaint No."; Rec."Complaint No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Complaint Number.';
                    Caption = 'Registration No.';
                }
                field("Complaint Date"; Rec."Complaint Date")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Complaint date.';
                    Caption = 'Registration Date';
                }
                field("Machine No."; Rec."Machine No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Machine Number.';
                }
                field("Machine Name"; Rec."Machine Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Machine Name.';
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Posted By.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Posting date.';
                }
                field("Problem Description"; Rec."Problem Description")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Problem Description.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = all;
                    ToolTip = 'It shows posted or not .';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the status of the Break down.';
                    OptionCaption = 'Open,Released,Rejected';
                }
                field(Criticality; Rec.Criticality)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the criticality of the Complaint.';
                }
                field("Maintenance Type"; Rec."Maintenance Type")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Maintenance type.';
                }
                field("Maintenance Type Name"; Rec."Maintenance Type Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Maintenance name.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Remarks.';
                }
                field("Machine Type"; Rec."Machine Type")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Machine type.';
                    OptionCaption = 'Int,Ext';
                }
                field(NoSeries; Rec.NoSeries)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the No Series.';
                }
                field("Complaint Release Date"; Rec."Complaint Release Date")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies theComplaint release date.';
                }
                field("Complaint Release Time"; Rec."Complaint Release Time")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the Complaint release time.';
                }
                field("Job Card No."; Rec."Job Card No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Job card number.';
                }
                field("Job Card Posted"; Rec."Job Card Posted")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines whether job card posted or not .';
                }
                field(External; Rec.External)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the maintenace is external.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the No Series.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the comments.';
                }
                field("Breakdown Status"; Rec."Breakdown Status")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the status of the Breakdown.';
                    OptionCaption = 'Registration,Complaints';
                }
                field("Plant ID"; Rec."Plant ID")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Plant ID.';
                }
                field(System; Rec.System)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the System.';
                }
                field("Job Card Status"; Rec."Job Card Status")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Status.';
                    OptionCaption = '" ,Open,Released"';
                }
                field(Originator; Rec.Originator)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Originator.';
                }
                field("Contact Man"; Rec."Contact Man")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Contact person.';
                }
            }
        }
    }

    actions
    {
    }
}

