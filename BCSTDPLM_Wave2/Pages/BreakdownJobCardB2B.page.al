page 33000969 "Breakdown Job Card B2B"
{

    Caption = 'Breakdown Job Card';
    DeleteAllowed = true;
    Editable = true;
    InsertAllowed = false;
    PageType = Document;
    SourceTable = "PM Job Header B2B";
    SourceTableView = WHERE(Posted = CONST(false),
                            Type = CONST(BreakDown));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    Editable = false;
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Job Card No.';
                }
                field("Machine ID"; Rec."Machine ID")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines machine ID.';
                }
                field("Machine Name"; Rec."Machine Name")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Machine Name.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines type.';
                    Editable = false;
                    Style = StandardAccent;
                    StyleExpr = TRUE;
                }
                field("Complaint No."; Rec."Complaint No.")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Complaint No.';
                    Editable = false;
                }
                field("Start Date Time"; Rec."Start Date Time")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Start date and time.';
                }
                field("End Date Time"; Rec."End Date Time")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines End Date and Time.';
                }
                field("Time Duration"; Rec."Time Duration")
                {
                    Visible = false;
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Time duration.';
                }
                field("Total Minutes"; Rec."Total Minutes")
                {
                    Editable = false;
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Total minutes.';
                }
                field("Time(Hrs)"; Rec."Time(Hrs)")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Time In hours.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    Editable = false;
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Department Code.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    Editable = false;
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Project code.';
                }
                field("Frequency Name"; Rec."Frequency Name")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Frequency name.';
                }
                field(Resource; Rec.Resource)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Resource.';
                }
                field(Maintenance; Rec."Maintenance Type")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Maintenance Type.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Status.';
                }
                field("Failure Type"; Rec."Failure Code")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Failure code.';
                    Editable = "Failure TypeEditable";
                }
                field("Failure Type Description"; Rec."Failure Description")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Failure type.';
                }
                field("Work Center"; Rec."Work Center")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Workcenter.';
                }
                field("Plant ID"; Rec."Plant ID")
                {
                    Editable = false;
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines plant ID.';
                }
            }
            part(PMJobLine1; "PM Job Line B2B")
            {
                ApplicationArea = ALL;
                Caption = 'PMJobLine1';
                SubPageLink = "Job Header No." = FIELD("No."),
                              "Machine ID" = FIELD("Machine ID");
            }
            group(Details)
            {
                Caption = 'Details';
                field("Expected Resource Cost"; Rec."Expected Resource Cost")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Expected Resource Cost.';
                }
                field("Expected Spares Cost"; Rec."Expected Spares Cost")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Expected Spares Cost.';
                }
                field("Actual Resource Cost"; Rec."Actual Resource Cost")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Actual Resource Cost.';
                }
                field("Actual Spares Cost"; Rec."Actual Spares Cost")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Actual Spares Cost.';
                }
                field("Total Cost"; Rec."Total Cost")
                {
                    Visible = false;
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Total cost.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Created By.';
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
        area(navigation)
        {
            group(BD)
            {
                Caption = 'BD &Job';
                action("Work Sheet")
                {
                    Caption = 'Work Sheet';
                    ApplicationArea = ALL;
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
                    Image = ViewComments;
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Comments.';

                    trigger OnAction();
                    begin
                        CurrPage.PMJobLine1.PAGE.ShowComments();
                    end;
                }
                group("Sub Contracting")
                {
                    Caption = 'Sub Contracting';
                    Image = ViewOrder;
                    action("Sub Contracting &Worksheet")
                    {
                        Caption = 'Sub Contracting &Worksheet';
                        Image = Worksheet;
                        ApplicationArea = ALL;
                        ToolTip = 'It Defines Subcontracting worksheet.';

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
                        ApplicationArea = ALL;
                        ToolTip = 'It Defines Subcontracting order.';

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
            group("&Line")
            {
                Caption = '&Line';
                action("Procedure")
                {
                    Caption = 'Procedure';
                    Image = AddWatch;
                    ApplicationArea = ALL;
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
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Safety Information.';
                    RunObject = Page "Job Card Line Safety Info B2B";
                    RunPageLink = "Job Card No." = FIELD("No."),
                                  "Machine ID" = FIELD("Machine ID");
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("Re&lease")
                {
                    Caption = 'Re&lease';
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Release Function.';
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction();
                    begin
                        Rec.TESTFIELD("Start Date Time");
                        Rec.TESTFIELD("End Date Time");
                        Rec.ReleaseStatus();
                    end;
                }
                action("Re&open")
                {
                    Caption = 'Re&open';
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Reopen Function.';
                    Image = ReOpen;

                    trigger OnAction();
                    begin
                        Rec.CheckWorkSheet();
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
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Post function.';
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
                action("Post Spares Consumed")
                {
                    Caption = 'Post Spares Consumed';
                    ApplicationArea = all;
                    ToolTip = 'It Defines Post Spare consumed.';
                    Visible = false;
                    Image = Post;

                    trigger OnAction();
                    begin
                        IF NOT CONFIRM(Text002Lbl, FALSE) THEN
                            EXIT;

                        Rec.PostConsumption(Rec);
                    end;
                }

            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        "Failure TypeEditable" := false;
        if Rec.Type = Rec.Type::BreakDown then
            "Failure TypeEditable" := true;
    end;

    trigger OnInit();
    begin
        "Failure TypeEditable" := true;
    end;

    var
        PMJobLine: Record "PM Job Line B2B";
        worksheet: Record "Work Sheet B2B";
        SubconWorkSheet: Record "SubCon WorkSheet B2B";
        BreakDownRec: Record "Breakdown Records B2B";
        PurchHeader: Record "Purchase Header";
        Text001Lbl: Label 'Do you want post Job Card ?';
        Text002Lbl: Label 'Do you want to post Consumptions?';

        Text003Lbl: Label 'End Time Should be greater than Start Time';
        Text0005Lbl: Label 'Work Sheet not posted.';
        Text0006Lbl: Label 'Work Sheet Empty.';
        [InDataSet]
        "Failure TypeEditable": Boolean;
}