page 33000970 "Other Job Card B2B"
{

    Caption = 'Others  Job  Card';
    DeleteAllowed = true;
    Editable = true;
    InsertAllowed = false;
    PageType = Document;
    SourceTable = "PM Job Header B2B";
    SourceTableView = WHERE(Posted = CONST(false),
                            Type = FILTER(Others | Predictive));
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines No.';
                    Editable = false;
                }
                field("Test Description"; Rec."Test Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines Description.';
                    Visible = "Test DescriptionVisible";
                }
                field("Other Description"; Rec."Other Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines Other Description.';
                    Visible = "Other DescriptionVisible";
                }
                field("Machine ID"; Rec."Machine ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines Machine ID.';
                }
                field("Machine Name"; Rec."Machine Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines Machine Name.';
                }
                field(Type; Rec.Type)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'It Defines Type of Maintenance.';
                    OptionCaption = 'PMR,BreakDown,Others,Predictive';
                    Style = StandardAccent;
                    StyleExpr = TRUE;
                }
                field("Start Date Time"; Rec."Start Date Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines Start date and time.';
                }
                field("End Date Time"; Rec."End Date Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines End date and time.';
                }
                field("Time Duration"; Rec."Time Duration")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines time Duration.';
                    Visible = false;
                }
                field("Total Minutes"; Rec."Total Minutes")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'It Defines total minutes.';
                }
                field("Time(Hrs)"; Rec."Time(Hrs)")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines total time in hours.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'It Defines Department code.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'It Defines Project code.';
                }
                field("Frequency Name"; Rec."Frequency Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines Frequency.';
                }
                field(Resource; Rec.Resource)
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines Resource.';
                }
                field(Maintenance; Rec."Maintenance Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines Maintenance type.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines status.';
                    OptionCaption = 'Open,Released';
                }
                field("Work Center"; Rec."Work Center")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines Workcenter.';
                }
            }
            part(PMJobLine1; "PM Job Line B2B")
            {
                Caption = 'PMJobLine1';
                ApplicationArea = All;
                SubPageLink = "Job Header No." = FIELD("No."),
                              "Machine ID" = FIELD("Machine ID");
            }
            group(Details)
            {
                Caption = 'Details';
                field("Expected Resource Cost"; Rec."Expected Resource Cost")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines Expected Resource Cost.';
                }
                field("Expected Spares Cost"; Rec."Expected Spares Cost")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines Expected Spares Cost.';
                }
                field("Actual Resource Cost"; Rec."Actual Resource Cost")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines Actual Resource Cost.';
                }
                field("Actual Spares Cost"; Rec."Actual Spares Cost")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines Actual spares Cost.';
                }
                field("Total Cost"; Rec."Total Cost")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines Total Cost.';
                    Visible = false;
                }
                /*field("CREATEDATETIME(""Created Date"" ,""Created Time"")"; CREATEDATETIME("Created Date", "Created Time"))
                {
                    ApplicationArea = All;
                }*/
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines Created by.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Others)
            {
                Caption = 'Other &Job';
                action("Planned Worksheet")
                {
                    Caption = 'Planned Worksheet';
                    ApplicationArea = All;
                    ToolTip = 'It Defines Planned worksheet.';
                    Image = PlanningWorksheet;

                    trigger OnAction();
                    begin

                        CurrPage.PMJobLine1.PAGE.OtherPlannedWorksheet();
                    end;
                }
                action("Work Sheet")
                {
                    Caption = 'Work Sheet';
                    ApplicationArea = All;
                    ToolTip = 'It Defines Worksheet.';
                    Image = Worksheet;

                    trigger OnAction();
                    begin
                        Rec.TESTFIELD("Maintenance Type");
                        Rec.TESTFIELD(Status, Rec.Status::Released);
                        worksheet.RESET();
                        worksheet.SETRANGE("Job Card No.", Rec."No.");
                        worksheet.SETRANGE("Machine ID", Rec."Machine ID");
                        PAGE.RUN(33000916, worksheet);
                    end;
                }
                action(Comments)
                {
                    Caption = 'Comments';
                    ApplicationArea = All;
                    ToolTip = 'It Defines Comments.';
                    Image = ViewComments;

                    trigger OnAction();
                    begin
                        CurrPage.PMJobLine1.PAGE.ShowComments();
                    end;
                }
            }
            group("&Line")
            {
                Caption = '&Line';
                action("Procedure")
                {
                    Caption = 'Procedure';
                    Image = AddWatch;
                    ApplicationArea = All;
                    ToolTip = 'It Defines Procedure.';

                    trigger OnAction();
                    begin
                        CurrPage.PMJobLine1.PAGE.ShowJobLineProcedures();
                    end;
                }
                action("Safety Information")
                {
                    Caption = 'Safety Information';
                    Image = Info;
                    ApplicationArea = All;
                    ToolTip = 'It Defines safety Information.';
                    RunObject = Page "Job Card Line Safety Info B2B";
                    RunPageLink = "Job Card No." = FIELD("No."),
                                  "Machine ID" = FIELD("Machine ID");
                }
                group("<Action1102152002>")
                {
                    Caption = 'Sub Contracting';
                    Image = ViewOrder;
                    action("<Action1102152004>")
                    {
                        Caption = 'Sub Contracting &Worksheet';
                        Image = Worksheet;
                        ApplicationArea = All;
                        ToolTip = 'It Defines Subcontracting Worksheet.';

                        trigger OnAction();
                        begin

                            SubconWorkSheet.RESET();
                            SubconWorkSheet.SETRANGE("Machine Id", Rec."Machine ID");
                            SubconWorkSheet.SETRANGE("Job Card No.", Rec."No.");
                            if SubconWorkSheet.FINDFIRST() then
                                if PurchHeader."No." = SubconWorkSheet."Purchase Order No." then begin
                                    PurchHeader.RESET();
                                    PurchHeader.SETRANGE("Machine Id B2B", SubconWorkSheet."Machine Id");
                                    PurchHeader.SETRANGE("Job Card No. B2B", SubconWorkSheet."Job Card No.");
                                    PAGE.RUN(33000897, SubconWorkSheet);
                                end
                                else
                                    ERROR('');
                        end;
                    }
                    action("Sub Contracting &Order")
                    {
                        Caption = 'Sub Contracting &Order';
                        Image = "Order";
                        ApplicationArea = All;
                        ToolTip = 'It Defines Subcontracting Order.';

                        trigger OnAction();
                        begin

                            SubconWorkSheet.RESET();
                            SubconWorkSheet.SETRANGE("Machine Id", Rec."Machine ID");
                            SubconWorkSheet.SETRANGE("Job Card No.", Rec."No.");
                            if SubconWorkSheet.FINDFIRST() then
                                if PurchHeader."No." <> SubconWorkSheet."Purchase Order No." then begin
                                    PurchHeader.RESET();
                                    PurchHeader.SETRANGE("Machine Id B2B", SubconWorkSheet."Machine Id");
                                    PurchHeader.SETRANGE("Job Card No. B2B", SubconWorkSheet."Job Card No.");
                                    PAGE.RUN(0, PurchHeader);
                                end;
                        end;
                    }
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("Re&lease")
                {
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    ApplicationArea = All;
                    ToolTip = 'It Defines Release function.';
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction();
                    begin
                        Rec.ReleaseStatus();
                    end;
                }
                action("Re&open")
                {
                    Caption = 'Re&open';
                    Image = ReOpen;
                    ApplicationArea = All;
                    ToolTip = 'It Defines Reopen Function.';


                    trigger OnAction();
                    begin
                        Rec.ReopenStatus();
                    end;
                }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                action("P&ost")
                {
                    Caption = 'P&ost';
                    ApplicationArea = All;
                    ToolTip = 'It Defines Posting Function.';

                    Ellipsis = true;
                    Image = Post;
                    ShortCutKey = 'F9';

                    trigger OnAction();
                    begin
                        Rec.TESTFIELD(Status, Rec.Status::Released);
                        Rec.TESTFIELD("Start Date Time");
                        Rec.TESTFIELD("End Date Time");

                        Rec.CheckWorkSheet();

                        worksheet.RESET();
                        worksheet.SETRANGE("Job Card No.", Rec."No.");
                        if worksheet.FINDFIRST() then begin
                            if not worksheet.Posted then
                                ERROR(Text0005Lbl);
                        end else
                            ERROR(Text0006Lbl);



                        if not CONFIRM(Text001Lbl, false) then
                            exit;
                        if Rec."Time(Hrs)" < 0 then
                            ERROR(Text003Lbl);


                        Rec.PostEquipmentJournal(Rec);

                        Rec.Posted := true;
                        Rec."Posted Date" := WORKDATE();
                        Rec."Posted By" := Format(USERID());
                        Rec.MODIFY();
                        PMJobLine.SETRANGE("Job Header No.", Rec."No.");
                        if PMJobLine.FIND('-') then
                            repeat
                                PMJobLine.Posted := true;
                                PMJobLine.MODIFY();
                            until PMJobLine.NEXT() = 0;


                        BreakDownRec.SETRANGE("Complaint No.", Rec."Complaint No.");
                        if BreakDownRec.FINDFIRST() then begin
                            BreakDownRec."Job Card Posted" := true;
                            BreakDownRec.MODIFY();
                        end;

                        Rec.UpdateWorkSheet();

                        CurrPage.UPDATE();
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin

        if Rec.Type = Rec.Type::Others then
            "Other DescriptionVisible" := true
        else
            "Other DescriptionVisible" := false;


        if Rec.Type = Rec.Type::Predictive then
            "Test DescriptionVisible" := true
        else
            "Test DescriptionVisible" := false;
    end;

    trigger OnInit();
    begin
        "Test DescriptionVisible" := true;
        "Other DescriptionVisible" := true;
    end;

    var
        worksheet: Record "Work Sheet B2B";
        PurchHeader: Record "Purchase Header";
        BreakDownRec: Record "Breakdown Records B2B";
        SubconWorkSheet: Record "SubCon WorkSheet B2B";
        PMJobLine: Record "PM Job Line B2B";
        Text001Lbl: Label 'Do you want post Job Card ?';
        Text003Lbl: Label 'End Time Should be greater than Start Time';
        Text0005Lbl: Label 'Work Sheet not posted.';
        Text0006Lbl: Label 'Work Sheet Empty.';
        [InDataSet]
        "Other DescriptionVisible": Boolean;
        [InDataSet]
        "Test DescriptionVisible": Boolean;

}

