(begin
    (load '.\lib\constants.lsp')
    (def dialogcreate(lambda (hwnd)
        (begin            
            (createbutton hwnd BS_PUSHBUTTON 1 'exit' (list 50 50 80 25) )            
        )                
    ))
    (def dialogcommand(lambda (hwnd)
        (begin
            (DestroyWindow hwnd)         
        )                
    ))
    (define dialogproc1(lambda (hwnd msg wp lp )
        (begin            
            (if (= WM_CREATE msg)(dialogcreate hwnd) )
            (if (= WM_COMMAND msg)(dialogcommand hwnd) )
        )                
    ))
    (def docreate(lambda (hwnd)
        (begin
            (RegisterDialogClass 'dialogclass'  'dialogproc1')
            (createbutton hwnd BS_PUSHBUTTON 1 'show dialog' (list 20 50 95 25) )
        )                
    ))
    (def docommand(lambda (hwnd)
        (begin
            (CreateDialogBox 'dialogclass' 'title' hwnd)
        )                
    ))
    (define winproc1(lambda (hwnd msg wp lp )
        (begin
            (if (= WM_DESTROY msg)(quit) )
            (if (= WM_CREATE msg)(docreate hwnd) )
            (if (= WM_COMMAND msg)(docommand hwnd) )
        )                
    ))
    (register (app) 'HelloWin1' 'winproc1')
    (create (app) 'HelloWin1')
)