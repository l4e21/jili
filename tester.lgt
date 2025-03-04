:- initialization(
       (logtalk_load(lgtunit(loader)),
        logtalk_load('loader', [debug(on), source_data(on)]),
        logtalk_load('tests/set', [hook(lgtunit)]),
        logtalk_load('tests/graph', [hook(lgtunit)]),
        logtalk_load('tests/topology', [hook(lgtunit)]),
        set_tests::run,
        graph_tests::run
        topology_tests::run
)).
